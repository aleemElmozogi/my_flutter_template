import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppOtpFormField extends StatelessWidget {
  const AppOtpFormField({
    super.key,
    required this.length,
    required this.name,
    required this.validator,
  });

  final int length;
  final String name;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FormBuilderTextField(
      name: name,
      validator: validator,
      keyboardType: TextInputType.number,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      maxLength: length,
      decoration: InputDecoration(
        counterText: '',
        hintText: List.filled(length, '0').join(),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: _outlineInputBorder(colorScheme.outlineVariant),
        enabledBorder: _outlineInputBorder(Colors.transparent),
        focusedBorder: _outlineInputBorder(colorScheme.primary),
        errorBorder: _outlineInputBorder(colorScheme.error),
        focusedErrorBorder: _outlineInputBorder(colorScheme.error),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 1),
  );
}
