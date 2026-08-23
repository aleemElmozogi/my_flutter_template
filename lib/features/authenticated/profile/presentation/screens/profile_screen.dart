import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/config/themes/theme_cubit.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_flutter_template/generated/l10n.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppScaffold(
      title: S.of(context).profile,
      contentPadding: const EdgeInsets.all(20),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.person_rounded,
              color: colorScheme.onPrimaryContainer,
              size: 38,
            ),
          ),
          const SizedBox(height: 14),
          AppText(S.of(context).profileTitle, fontWeight: FontWeight.w700),
          const SizedBox(height: 8),
          AppText(
            S.of(context).profileDescription,
            maxLines: 4,
            overflow: TextOverflow.visible,
            textColor: theme.appColors.mutedText,
          ),
          const SizedBox(height: 24),
          const _ThemeModeSelector(),
          const SizedBox(height: 24),
          AppButton(
            title: S.of(context).logoutTitle,
            backgroundColor: colorScheme.surface,
            borderColor: colorScheme.primary,
            titleColor: colorScheme.primary,
            onTab: () => context.read<AuthCubit>().logOut(),
          ),
        ],
      ),
    );
  }
}

class _ThemeModeSelector extends StatelessWidget {
  const _ThemeModeSelector();

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
