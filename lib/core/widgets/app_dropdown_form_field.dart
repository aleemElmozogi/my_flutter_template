import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDropdownFormField<T> extends StatelessWidget {
  final String name;
  final String? labelText;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? initialValue;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final IconData? prefixIcon;

  const AppDropdownFormField({
    required this.name,
    required this.items,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: name,
      child: FormBuilderDropdown<T>(
        name: name,
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.grey),
          filled: true,
          fillColor: AppColors.lightGrey, // Background fill color
          border: outlineInputBorder(AppColors.black),
          enabledBorder: outlineInputBorder(Colors.transparent),
          errorBorder: outlineInputBorder(AppColors.red),
          focusedErrorBorder: outlineInputBorder(AppColors.red),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grey),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: AppColors.grey)
              : null,
        ),
        items: items,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: color, width: 0.5),
      );
}
