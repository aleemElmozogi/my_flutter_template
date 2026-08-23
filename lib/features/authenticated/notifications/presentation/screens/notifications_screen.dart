import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/generated/l10n.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: S.of(context).notifications,
      body: const _NotificationsEmptyState(),
    );
  }
}

class _NotificationsEmptyState extends StatelessWidget {
  const _NotificationsEmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.notifications_none_rounded,
          size: 56,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 12),
        AppText(
          S.of(context).emptyNotificationsTitle,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 8),
        AppText(
          S.of(context).emptyNotificationsDescription,
          maxLines: 3,
          overflow: TextOverflow.visible,
          textColor: theme.appColors.mutedText,
        ),
      ],
    );
  }
}
