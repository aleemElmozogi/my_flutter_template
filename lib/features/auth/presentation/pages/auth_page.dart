// import 'package:my_flutter_template/config/locale/app_localizations.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/utils/app_locale.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:my_flutter_template/core/utils/dialog_extension.dart';
import 'package:my_flutter_template/core/utils/snackbar_extention.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:my_flutter_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_flutter_template/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/core/validation/input_validation.dart';
import 'package:my_flutter_template/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:my_flutter_template/core/utils/app_locale.dart';
import 'package:my_flutter_template/generated/l10n.dart';
part '../listeners/sign_in_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            previous.fetchUserInfoState != current.fetchUserInfoState ||
            previous.signInStatus != current.signInStatus,
        listener: _parseSignInStatus,
        child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              previous.fetchUserInfoState != current.fetchUserInfoState ||
              previous.signInStatus != current.signInStatus,
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, state) {
                      return DropdownButton(
                          value: state.locale,
                          items: const [
                            DropdownMenuItem(
                              value: AppLocale.ar,
                              child: AppText(AppStrings.arabicCode),
                            ),
                            DropdownMenuItem(
                              value: AppLocale.en,
                              child: AppText(AppStrings.englishCode),
                            ),
                          ],
                          onChanged: (Locale? v) {
                            context
                                .read<LocaleCubit>()
                                .changeLang(v ?? AppLocale.en);
                          });
                    },
                  ),
                  TextFormField(
                    validator: InputValidation.emailValidation(),
                    onChanged: context.read<AuthCubit>().onEmailChange,
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    validator: InputValidation.passwordValidation(),
                    onChanged: context.read<AuthCubit>().onPinChange,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.ac_unit),
                      Icon(Icons.access_alarm_rounded)
                    ],
                  ),
                  SizedBox(height: 5.h),
                  state.signInStatus.isInProgress
                      ? const AppLoadingIndicator()
                      : AppButton(
                          title: S.of(context).helloWorld,
                          onTab: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login();
                            }
                          })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
