import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextFormField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final bool autofocus;
  final int? maxLength;
  final Color? enabledBorderColor;
  final double borderWidth;
  final int? maxLines;
  final int? minLines;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final String? initalValue;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;

  const AppTextFormField({
    required this.name,
    this.isPassword = false,
    this.autofocus = false,
    this.labelText,
    this.enabledBorderColor,
    this.hintText,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.borderWidth = 0.5,
    this.initalValue,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType,
    super.key,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: widget.name,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: widget.controller,
            name: widget.name,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            minLines: widget.isPassword ? null : widget.minLines,
            initialValue: widget.initalValue,
            autofocus: widget.autofocus,
            validator: widget.validator,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(color: colorScheme.outline),
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: outlineInputBorder(colorScheme.onSurface),
              enabledBorder: outlineInputBorder(
                widget.enabledBorderColor ?? Colors.transparent,
              ),
              errorBorder: outlineInputBorder(colorScheme.error),
              focusedErrorBorder: outlineInputBorder(colorScheme.error),
              contentPadding: const EdgeInsets.all(
                15.0,
              ), // Padding inside the text field
              errorMaxLines: 2,
              hintText: widget.hintText, // Placeholder text
              hintStyle: TextStyle(color: colorScheme.outline),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(widget.prefixIcon, color: colorScheme.outline),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : widget.suffixIcon,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0), // Rounded corners
    borderSide: BorderSide(
      color: color, // Border color when focused and there's an error
      width: widget.borderWidth,
    ),
  );
}
