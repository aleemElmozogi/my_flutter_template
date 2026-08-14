import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: _controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: colorScheme.outline),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: _outlineInputBorder(colorScheme.onSurface),
        enabledBorder: _outlineInputBorder(Colors.transparent),
        errorBorder: _outlineInputBorder(colorScheme.error),
        focusedErrorBorder: _outlineInputBorder(colorScheme.error),
        disabledBorder: _outlineInputBorder(colorScheme.outline),
        contentPadding: const EdgeInsets.all(15.0),
        hintText: 'البحث علي مشروع',
        hintStyle: TextStyle(color: colorScheme.outline),
        prefixIcon: Icon(Icons.search, color: colorScheme.outline),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, color: colorScheme.outline),
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
