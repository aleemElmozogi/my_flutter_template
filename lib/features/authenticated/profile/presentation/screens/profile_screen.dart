import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_language_selector.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/app_theme_mode_selector.dart';
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
          const AppLanguageSelector(),
          const SizedBox(height: 20),
          const AppThemeModeSelector(),
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
