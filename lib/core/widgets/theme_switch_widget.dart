import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/theme_mode_cubit.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, state) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final colorScheme = Theme.of(context).colorScheme;

        return GestureDetector(
          onTap: () => context.read<ThemeModeCubit>().toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),

            curve: Curves.easeInOut,
            width: 60,
            height: 32,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDark
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest,
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: !isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? colorScheme.primary : colorScheme.onSurface,
                ),
                child: Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                  size: 16,
                  color: isDark ? colorScheme.onPrimary : colorScheme.surface,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// An [IconButton] variant for quick placement in app bars.
class ThemeSwitchIconButton extends StatelessWidget {
  const ThemeSwitchIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, state) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return IconButton(
          onPressed: () => context.read<ThemeModeCubit>().toggleTheme(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                RotationTransition(turns: animation, child: child),
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
            ),
          ),
          tooltip: isDark ? 'تبديل إلى الوضع الفاتح' : 'تبديل إلى الوضع الداكن',
        );
      },
    );
  }
}
