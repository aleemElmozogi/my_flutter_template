import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? drawer;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final AppBar? appBar;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? bottomNavigation;
  final EdgeInsets contentPadding;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final List<Color> backgroundColorGradient;
  final String title;
  final String? backgroundImage;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool safeTopArea;
  final bool safeBottomArea;
  final bool extendBodyBehindAppBar;
  final List<BlocListener<StateStreamable<dynamic>, dynamic>> listenersList;
  final List<BlocProvider> providersList;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.title = '',
    this.titleWidget,
    this.appBar,
    this.drawer,
    this.bottomNavigation,
    this.floatingActionButton,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 25.0,
      horizontal: 20,
    ),
    this.resizeToAvoidBottomInset = true,
    this.safeTopArea = true,
    this.safeBottomArea = false,
    this.extendBody = false,
    this.backgroundImage,
    this.backgroundColorGradient = const [],
    this.listenersList = const [],
    this.providersList = const [],
    this.scaffoldKey,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerFloat,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.appColors.scaffold;
    final effectiveAppBarBackgroundColor =
        appBarBackgroundColor ?? Colors.transparent;

    return Container(
      decoration: backgroundColorGradient.isNotEmpty
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: backgroundColorGradient,
              ),
            )
          : BoxDecoration(color: effectiveBackgroundColor),
      child: SafeArea(
        top: safeTopArea,
        bottom: safeBottomArea,
        child: Scaffold(
          extendBody: extendBody,
          key: scaffoldKey,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          bottomNavigationBar: bottomNavigation,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          drawer: drawer,
          backgroundColor: backgroundColorGradient.isEmpty
              ? effectiveBackgroundColor
              : Colors.transparent,
          appBar:
              appBar ??
              (title.isNotEmpty
                  ? AppBar(
                      actionsIconTheme: IconThemeData(
                        color: theme.colorScheme.onSurface,
                      ),
                      backgroundColor: effectiveAppBarBackgroundColor,
                      iconTheme: IconThemeData(
                        color: theme.colorScheme.onSurface,
                      ),
                      actions: actions,
                      title:
                          titleWidget ??
                          AppText(
                            title,
                            fontSize: 18,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  : AppBar(
                      forceMaterialTransparency: true,
                      elevation: 0,
                      actionsIconTheme: IconThemeData(
                        color: theme.colorScheme.onSurface,
                      ),
                      iconTheme: IconThemeData(
                        color: theme.colorScheme.onSurface,
                      ),
                    )),
          body: Container(
            decoration: backgroundImage != null
                ? BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundImage ?? ''),
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
            child: Center(
              child: Padding(
                padding: contentPadding,
                child: providersList.isNotEmpty
                    ? MultiBlocProvider(
                        providers: [...providersList],
                        child: listenersList.isNotEmpty
                            ? MultiBlocListener(
                                listeners: [...listenersList],
                                child: body,
                              )
                            : body,
                      )
                    : listenersList.isNotEmpty
                    ? MultiBlocListener(
                        listeners: [...listenersList],
                        child: body,
                      )
                    : body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
