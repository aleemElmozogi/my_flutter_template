import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDateFormField extends StatefulWidget {
  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const AppDateFormField({
    required this.name,
    this.labelText,
    this.hintText,
    this.validator,
    this.controller,
    this.prefixIcon,
    super.key,
    this.firstDate,
    this.lastDate,
  });

  @override
  _AppDateFormFieldState createState() => _AppDateFormFieldState();
}

class _AppDateFormFieldState extends State<AppDateFormField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FormBuilderDateTimePicker(
      controller: widget.controller,
      name: widget.name,
      inputType: InputType.date,
      initialDate: widget.lastDate ?? DateTime(2013),
      firstDate: widget.firstDate ?? DateTime(1950),
      lastDate: widget.lastDate ?? DateTime(2013, 12, 31),
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value?.toString());
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: outlineInputBorder(colorScheme.outline),
        enabledBorder: outlineInputBorder(Colors.transparent),
        errorBorder: outlineInputBorder(colorScheme.error),
        focusedErrorBorder: outlineInputBorder(colorScheme.error),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: theme.hintColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: color, width: 0.5),
  );
}
