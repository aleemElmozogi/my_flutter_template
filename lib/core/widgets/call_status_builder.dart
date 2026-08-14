import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/widgets/error_widget.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';

class CallStatusBuilder extends StatelessWidget {
  const CallStatusBuilder({
    super.key,
    required this.status,
    required this.onSuccess,
    required this.onRetry,
    this.onLoading,
    this.hasData = false,
  });

  final CallStatus status;
  final Widget Function() onSuccess;
  final VoidCallback onRetry;
  final Widget Function()? onLoading;
  final bool hasData;

  @override
  Widget build(BuildContext context) {
    if (status.isInProgress && !hasData) {
      final loadingBuilder = onLoading;
      if (loadingBuilder != null) return loadingBuilder();

      return Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h),
        child: const AppLoadingIndicator(),
      );
    }

    if (status.isFailed && !hasData) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h),
        child: AppErrorWidget(onPress: onRetry),
      );
    }

    return onSuccess();
  }
}
