import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  final Function() backButtonTab;
  const AppBarWidget({
    super.key,
    required this.backButtonTab,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25.w,
        ),
        Container(
          height: 30.h,
          width: 30.w,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                right: -8.w,
                bottom: -9.h,
                child: IconButton(
                  onPressed: backButtonTab,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15.0.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80.w,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/login/Group 1597883921.png"),
            ),
            AppText(
              "Dinaro",
              textAlign: TextAlign.center,

            ),
          ],
        ),
      ],
    );
  }
}
