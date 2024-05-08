import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onTab;
  final Color backgroundColor;
  final Color borderColor;
  final bool withSplash;
  final Color foregroundColor;
  final bool isSemanticButton;
  final double borderRadius;
  final double? height;
  final double width;
  final Color titleColor;
  final EdgeInsets innerPadding;
  final double elevation; // Add elevation property

  const AppButton({
    super.key,
    required this.title,
    required this.onTab,
    this.backgroundColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.height,
    this.elevation = 0,
    this.withSplash = true,
    this.width = double.infinity,
    this.innerPadding = const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    this.foregroundColor = AppColors.black,
    this.isSemanticButton = false,
    this.titleColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: double.infinity,
      child: Material(
        elevation: elevation, // Apply elevation to Material widget
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r),

        child: TextButton(
          isSemanticButton: isSemanticButton,
          style: ButtonStyle(
            overlayColor: withSplash
                ? null
                : MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
            padding: MaterialStateProperty.all<EdgeInsets>(innerPadding),
            foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(color: borderColor),
              ),
            ),
          ),
          onPressed: () => onTab(),
          child: Center(
              child: AppText(
            title,
            textColor: titleColor,
          )),
        ),
      ),
    );
  }
}
