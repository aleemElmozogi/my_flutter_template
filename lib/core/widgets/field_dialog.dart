import 'package:my_flutter_template/config/routes/navigation.dart';
import 'package:my_flutter_template/core/enums/validation_status.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';


class FieldDialog extends StatelessWidget {
  const FieldDialog({
    super.key,
    required this.onTap,
    required this.inputValidation,
    required this.title,
    required this.errorText,
    required this.hintText,
    this.onClear,
    this.submitButtonTitle,
    required this.onTextChange,
  });

  final ValidationState inputValidation;
  final String title;
  final String? submitButtonTitle;
  final String errorText;
  final String hintText;
  final Function() onTap;
  final Function()? onClear;
  final Function(String text) onTextChange;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      title: Center(
        child: AppText(
          title,
        ),
      ),
      content: TextField(
        textAlign: TextAlign.center,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            hintText: hintText,
            errorMaxLines: 2,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorText: inputValidation.isValid ? null : errorText),
        onChanged: onTextChange,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onTap,
              child: AppText(submitButtonTitle ?? 'تأكيد'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const AppText('إلغاء'),
              onPressed: () {
                if (onClear != null) {
                  onClear!();
                }
                context.goPop();
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
