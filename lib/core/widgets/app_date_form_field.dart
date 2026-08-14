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
  State<AppDateFormField> createState() => _AppDateFormFieldState();
}

class _AppDateFormFieldState extends State<AppDateFormField> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FormBuilderDateTimePicker(
      controller: widget.controller,
      name: widget.name,
      inputType: InputType.date,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1950),
      lastDate: widget.lastDate ?? DateTime.now(),
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value?.toString());
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: colorScheme.outline),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: outlineInputBorder(colorScheme.onSurface),
        enabledBorder: outlineInputBorder(Colors.transparent),
        errorBorder: outlineInputBorder(colorScheme.error),
        focusedErrorBorder: outlineInputBorder(colorScheme.error),
        contentPadding: const EdgeInsets.all(15.0),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: colorScheme.outline),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: colorScheme.outline),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: color, width: 0.5),
  );
}
