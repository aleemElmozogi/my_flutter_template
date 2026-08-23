import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/generated/l10n.dart';

@RoutePage()
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  List<_MainShellTab> _tabs(BuildContext context) => [
    _MainShellTab(
      label: S.of(context).home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    _MainShellTab(
      label: S.of(context).notifications,
      icon: Icons.notifications_none_rounded,
      selectedIcon: Icons.notifications_rounded,
    ),
    _MainShellTab(
      label: S.of(context).profile,
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeColors = Theme.of(context).appColors;
    final tabs = _tabs(context);

    return AutoTabsRouter(
      routes: const [HomeRoute(), NotificationsRoute(), ProfileRoute()],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(top: BorderSide(color: themeColors.border)),
            ),
            child: NavigationBar(
              height: 72,
              backgroundColor: colorScheme.surface,
              surfaceTintColor: Colors.transparent,
              selectedIndex: tabsRouter.activeIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: tabs
                  .map(
                    (tab) => NavigationDestination(
                      icon: Icon(tab.icon),
                      selectedIcon: Icon(
                        tab.selectedIcon,
                        color: colorScheme.primary,
                      ),
                      label: tab.label,
                    ),
                  )
                  .toList(growable: false),
              onDestinationSelected: (index) {
                if (index == tabsRouter.activeIndex) {
                  tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
                  return;
                }
                tabsRouter.setActiveIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}

class _MainShellTab {
  const _MainShellTab({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
