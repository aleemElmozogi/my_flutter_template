import 'package:flutter/material.dart';
import 'package:my_flutter_template/core/widgets/app_text_form_field.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

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
    final theme = Theme.of(context);

    return AppTextFormField(
      name: 'search',
      controller: _controller,
      hintText: S.of(context).searchProjectHint,
      prefixIcon: Icons.search,
      onChanged: (value) {
        setState(() {});
        widget.onChanged(value ?? '');
      },
      suffixIcon: _controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear, color: theme.hintColor),
              onPressed: () {
                setState(() {
                  _controller.clear();
                });
                widget.onChanged('');
              },
            )
          : null,
    );
  }
}
