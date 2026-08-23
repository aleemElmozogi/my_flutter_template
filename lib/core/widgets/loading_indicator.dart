import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size = 40, this.fillColor});
  final int size;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.h,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: [fillColor ?? Theme.of(context).colorScheme.primary],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
