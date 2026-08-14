import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/utils/dialog_extension.dart';
import 'package:my_flutter_template/core/widgets/appStepper/cubit/stepper_view_cubit.dart';
import 'package:my_flutter_template/core/models/fetch_status.dart';

typedef AuthStatusSelector<S> = BaseContentState<dynamic> Function(S state);

BlocListener<C, S> authActionLoadingDialogListener<
  C extends StateStreamable<S>,
  S
>({required List<AuthStatusSelector<S>> statuses}) {
  return BlocListener<C, S>(
    listenWhen: (previous, current) {
      final wasLoading = statuses.any(
        (status) => status(previous).status.isInProgress,
      );
      final isLoading = statuses.any(
        (status) => status(current).status.isInProgress,
      );
      return wasLoading != isLoading;
    },
    listener: (context, state) {
      final isLoading = statuses.any(
        (status) => status(state).status.isInProgress,
      );
      if (isLoading) {
        context.showLoadingDialog();
      } else {
        Navigator.of(context, rootNavigator: true).pop();
      }
    },
  );
}

BlocListener<C, S> authOtpStepperListener<C extends StateStreamable<S>, S>({
  required AuthStatusSelector<S> sendOtp,
  required AuthStatusSelector<S> verifyOtp,
}) {
  return BlocListener<C, S>(
    listenWhen: (previous, current) =>
        sendOtp(previous).status != sendOtp(current).status ||
        verifyOtp(previous).status != verifyOtp(current).status,
    listener: (context, state) {
      if (sendOtp(state).status.isSucceeded) {
        context.read<AppStepperViewCubit>().goToStep(1);
      }
      if (verifyOtp(state).status.isSucceeded) {
        context.read<AppStepperViewCubit>().goToStep(2);
      }
    },
  );
}

BlocListener<C, S> authFailureDialogsListener<C extends StateStreamable<S>, S>({
  required List<AuthStatusSelector<S>> statuses,
}) {
  return BlocListener<C, S>(
    listenWhen: (previous, current) => statuses.any(
      (status) => status(previous).status != status(current).status,
    ),
    listener: (BuildContext context, S state) {
      for (final status in statuses) {
        final currentStatus = status(state);
        if (currentStatus.status.isFailed) {
          context.showErrorDialog(currentStatus.message);
        }
      }
    },
  );
}
