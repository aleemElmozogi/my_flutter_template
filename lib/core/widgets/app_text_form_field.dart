import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextFormField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final int? maxLength;
  final Color? enabledBorderColor;
  final double borderWidth;
  final int maxLines;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;
  final String? initalValue;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final String? errorText;
  final int? errorMaxLines;

  const AppTextFormField({
    required this.name,
    this.isPassword = false,
    this.labelText,
    this.enabledBorderColor,
    this.hintText,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.borderWidth = 0.5,
    this.initalValue,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.errorMaxLines,
    super.key,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Semantics(
      label: widget.name,
      child: FormBuilderTextField(
        controller: widget.controller,
        name: widget.name,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        initialValue: widget.initalValue,
        validator: widget.validator,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: outlineInputBorder(colorScheme.outline),
          enabledBorder: outlineInputBorder(
            widget.enabledBorderColor ?? Colors.transparent,
          ),
          errorBorder: outlineInputBorder(colorScheme.error),
          focusedErrorBorder: outlineInputBorder(colorScheme.error),
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: widget.errorMaxLines,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(widget.prefixIcon, color: theme.hintColor),
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
