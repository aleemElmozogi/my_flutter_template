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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Semantics(
      label: name,
      child: FormBuilderDropdown<T>(
        name: name,
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: outlineInputBorder(colorScheme.outline),
          enabledBorder: outlineInputBorder(Colors.transparent),
          errorBorder: outlineInputBorder(colorScheme.error),
          focusedErrorBorder: outlineInputBorder(colorScheme.error),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 12.0,
          ),
          hintText: hintText,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: theme.hintColor)
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
