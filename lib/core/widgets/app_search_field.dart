import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  _AppSearchFieldState createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: _outlineInputBorder(AppColors.black),
        enabledBorder: _outlineInputBorder(Colors.transparent),
        errorBorder: _outlineInputBorder(AppColors.red),
        focusedErrorBorder: _outlineInputBorder(AppColors.red),
        disabledBorder: _outlineInputBorder(AppColors.grey),
        contentPadding: const EdgeInsets.all(15.0),
        hintText: 'البحث علي مشروع',
        hintStyle: const TextStyle(
          color: AppColors.grey,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.grey,
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.clear, color: AppColors.grey),
          onPressed: () {
            setState(() {
              _controller.clear();
            });
            widget.onChanged('');
          },
        )
            : null,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0), // Rounded corners
    borderSide: BorderSide(
      color: color, // Border color when focused and there's an error
      width: 0.5,
    ),
  );
}