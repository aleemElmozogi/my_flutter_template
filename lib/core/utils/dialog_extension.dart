
import 'package:my_flutter_template/config/routes/navigation.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
        return const Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: AppLoadingIndicator(),
            ));
      },
    );
  }

  Future<void> showSuccessDialog(
      {required String message, VoidCallback? onClose}) async {
    showDialog(
      context: this,

      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
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
                      context.pop();
                      onClose();
                    }
                  : context.pop,
              title:   S.of(context).ok,

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
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return child;
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
          dismissible ?? false, // Dialog cannot be dismissed by tapping outside
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
              title:
                submitTxt ?? S.of(context).ok,
            ),
            SizedBox(
              height: 7.h,
            ),
            AppButton(
              onTab: context.goPop,
              title:submitTxt ?? S.of(context).cancel,
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: this,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
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
          content: AppText(message,
            maxLines: 3,
          ),
          actions: <Widget>[
            AppButton(
              backgroundColor: AppColors.red,
              onTab: () {
                context.pop(); // Close the dialog
              },
              elevation: 2,
              title:  'حسنًا',
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
              onTab: () {
                context.pop(); // Close the dialog
              },
              elevation: 2,
              title:  'حسنًا',

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
          title: type.message,
          message: message,
          contentType: type,
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
