import 'package:my_flutter_template/core/enums/validation_status.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_flutter_template/generated/l10n.dart';

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
  final VoidCallback onTap;
  final VoidCallback? onClear;
  final ValueChanged<String> onTextChange;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title: Center(child: AppText(title)),
      content: FormBuilder(
        child: AppTextFormField(
          name: 'field_dialog_value',
          hintText: hintText,
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          errorMaxLines: 2,
          errorText: inputValidation.isValid ? null : errorText,
          enabledBorderColor: Theme.of(context).colorScheme.primary,
          onChanged: (value) => onTextChange(value ?? ''),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppButton(
                title: submitButtonTitle ?? S.of(context).confirm,
                onTab: onTap,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppButton(
                title: S.of(context).cancel,
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.primary,
                titleColor: Theme.of(context).colorScheme.primary,
                onTab: () {
                  if (onClear != null) {
                    onClear!();
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
