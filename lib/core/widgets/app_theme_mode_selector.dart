import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/config/themes/theme_cubit.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class AppThemeModeSelector extends StatelessWidget {
  const AppThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          S.of(context).theme,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        BlocBuilder<ThemeCubit, ThemeState>(
          buildWhen: (previous, current) =>
              previous.themeMode != current.themeMode,
          builder: (context, state) {
            return SegmentedButton<ThemeMode>(
              selected: {state.themeMode},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return theme.colorScheme.primaryContainer;
                  }
                  return theme.appColors.fieldFill;
                }),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return theme.colorScheme.onPrimaryContainer;
                  }
                  return theme.colorScheme.onSurface;
                }),
                side: WidgetStateProperty.all(
                  BorderSide(color: theme.appColors.border),
                ),
              ),
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.settings_suggest_outlined),
                  label: Text(S.of(context).systemTheme),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode_outlined),
                  label: Text(S.of(context).lightTheme),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode_outlined),
                  label: Text(S.of(context).darkTheme),
                ),
              ],
              onSelectionChanged: (selection) {
                context.read<ThemeCubit>().changeThemeMode(selection.single);
              },
            );
          },
        ),
      ],
    );
  }
}
