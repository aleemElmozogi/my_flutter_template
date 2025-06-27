import 'package:my_flutter_template/core/utils/app_colors.dart';
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
  final Function(String?)? onChanged;
  final String? initalValue;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;

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
    this.maxLength,
    this.keyboardType,
    super.key,
  });

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
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
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: AppColors.grey),

          filled: true,
          fillColor: AppColors.lightGrey, // Background fill color
          border: outlineInputBorder(AppColors.black),
          enabledBorder: outlineInputBorder(
              widget.enabledBorderColor ?? Colors.transparent),
          errorBorder: outlineInputBorder(AppColors.red),
          focusedErrorBorder: outlineInputBorder(AppColors.red),
          contentPadding:
              const EdgeInsets.all(15.0), // Padding inside the text field
          hintText: widget.hintText, // Placeholder text
          hintStyle: const TextStyle(
            color: AppColors.grey,
          ),
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(
                  widget.prefixIcon,
                  color: AppColors.grey,
                ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
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
