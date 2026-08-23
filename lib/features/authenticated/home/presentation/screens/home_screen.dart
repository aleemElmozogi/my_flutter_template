import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: S.of(context).home,
      contentPadding: const EdgeInsets.all(20),
      body: ListView(
        children: [
          const _HomeHeader(),
          const SizedBox(height: 16),
          _HomePlaceholderCard(
            title: S.of(context).homeStarterTitle,
            description: S.of(context).homeStarterDescription,
            icon: Icons.dashboard_customize_outlined,
          ),
          const SizedBox(height: 12),
          _HomePlaceholderCard(
            title: S.of(context).homeTemplateReadyTitle,
            description: S.of(context).homeTemplateReadyDescription,
            icon: Icons.layers_outlined,
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              S.of(context).homeWelcomeTitle,
              textColor: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            AppText(
              S.of(context).homeWelcomeDescription,
              textColor: colorScheme.onPrimaryContainer,
              maxLines: 3,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePlaceholderCard extends StatelessWidget {
  const _HomePlaceholderCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.appColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: themeColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: themeColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    description,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    textColor: themeColors.mutedText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
