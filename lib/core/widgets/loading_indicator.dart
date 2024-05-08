import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key,  this.size = 40});
  final int size;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: size.h,
        child:const LoadingIndicator(
            indicatorType: Indicator.lineScale,
            colors: [AppColors.primary],
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent),
      ),
    );
  }
}
