import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:my_flutter_template/generated/l10n.dart';
import 'app_colors.dart';

extension DialogExtension on BuildContext {
  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            child: SizedBox(
              height: 100.h,
              width: 100.h,
              child: const Center(
                child: AppLoadingIndicator(),
              ),
            ));
      },
    );
  }

  Future<void> showSuccessDialog(
      {required String message, VoidCallback? onClose}) async {
    showDialog(
      context: this,

      barrierDismissible: true, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: Icon(
            Icons.check_circle_outline,
            color: AppColors.primary,
            size: 48.0.r,
          ),
          content: AppText(
            message,
            maxLines: 3,
          ),
          actions: <Widget>[
            AppButton(
              onTab: onClose != null
                  ? () {
                      Navigator.of(context).pop();
                      onClose();
                    }
                  : Navigator.of(context).pop,
              title: S.of(context).agree,
            ),
          ],
        );
      },
    );
  }

  Future<void> showAppBottomSheet({required Widget child}) async {
    showModalBottomSheet(
      context: this,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Prevent hiding
          ),
          child: child,
        );
      },
    );
  }

  void showConfirmationDialog(
      {required String title,
      bool? dismissible,
      required Function() onSubmit,
      String? submitTxt}) {
    showDialog(
      context: this,
      barrierDismissible:
          dismissible ?? true, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: AppText(
            title,
            maxLines: 3,
          ),
          actions: <Widget>[
            AppButton(
              onTab: onSubmit,
              title: submitTxt ?? S.of(context).agree,
            ),
            SizedBox(
              height: 7.h,
            ),
            AppButton(
              onTab: () => Navigator.pop(context),
              title: submitTxt ?? S.of(context).cancel,
            ),
          ],
        );
      },
    );
  }

  void showTwoChoicesDialog({
    required String title,
    String? message,
    required String firstChoice,
    required VoidCallback onFirstChoice,
    required String secondChoice,
    required VoidCallback onSecondChoice,
    bool? dismissible,
  }) {
    showDialog(
      context: this,
      barrierDismissible: dismissible ?? true,
      builder: (BuildContext context) {
        int? selectedOption; // To track selected radio button

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: AppText(
                title,
                fontWeight: FontWeight.bold,
              ),
              content: SizedBox(
                width: 1.sw,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if ((message ?? '').isNotEmpty) ...[
                      AppText(
                        message ?? '',
                        textColor: AppColors.darkGrey,
                        maxLines: 3,
                      ),
                      SizedBox(height: 10.h),
                    ],

                    // First Choice
                    RadioListTile<int>(
                      value: 1,
                      groupValue: selectedOption,
                      tileColor: AppColors.lightGrey,
                      selectedTileColor: AppColors.lightPrimary,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                      title: AppText(
                        firstChoice,
                        textAlign: TextAlign.start,
                      ),
                      activeColor: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    // Second Choice
                    RadioListTile<int>(
                      value: 2,
                      groupValue: selectedOption,
                      tileColor: AppColors.lightGrey,
                      selectedTileColor: AppColors.lightPrimary,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                      title: AppText(
                        secondChoice,
                        textAlign: TextAlign.start,
                      ),
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              actions: [
                AppButton(
                  backgroundColor: AppColors.primary,
                  title: 'تأكيد',
                  onTab: () {
                    if (selectedOption == 1) {
                      onFirstChoice();
                    } else if (selectedOption == 2) {
                      onSecondChoice();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: this,
      barrierDismissible: true, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: Icon(
            Icons.error_outline,
            color: AppColors.red,
            size: 48.0,
          ),
          content: AppText(
            message,
            maxLines: 5,
          ),
          actions: <Widget>[
            AppButton(
              backgroundColor: AppColors.red,
              onTab: Navigator.of(context).pop,
              elevation: 2,
              title: S.of(context).agree,
            ),
          ],
        );
      },
    );
  }

  void showAlertDialog({
    required String message,
    required String title,
  }) {
    showDialog(
      context: this,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(
            Icons.error_outline,
            color: AppColors.red,
            size: 48.0,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(title, fontWeight: FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              const Divider(),
              SizedBox(
                height: 2.h,
              ),
              AppText(message),
            ],
          ),
          actions: <Widget>[
            AppButton(
              backgroundColor: AppColors.primary,
              onTab: Navigator.of(context).pop,
              elevation: 2,
              title: S.of(context).agree,
            ),
          ],
        );
      },
    );
  }

  void showAppSnackBar(
      {required ContentType type,
      required String title,
      required String message}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: type,
          messageFontSize: 13.sp,
          titleFontSize: 14.sp,
        ),
      ));
  }

  void showSnackBar({
    required String message,
    required Color background,
    required Color messageColor,
    SnackBarAction? action,
    double? elevation,
    EdgeInsets? margin,
    EdgeInsets? padding,
    SnackBarBehavior? behavior,
    ShapeBorder? shape,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: AppText(
        message,
        textColor: messageColor,
      ),
      backgroundColor: background,
      shape: shape,
      margin: margin,
      padding: padding,
      elevation: elevation,
      behavior: behavior,
      action: action,
      duration: duration,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
