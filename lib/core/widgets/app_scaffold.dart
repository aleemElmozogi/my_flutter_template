import 'package:my_flutter_template/core/utils/app_colors.dart';
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
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final List<Color> backgroundColorGradient;
  final String title;
  final String? backgroundImage;
  final bool resizeToAvoidBottomInset;
  final bool safeTopArea;
  final bool safeBottomArea;
  final bool extendBodyBehindAppBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppScaffold(
      {super.key,
      required this.body,
      this.backgroundColor = AppColors.white,
      this.appBarBackgroundColor = Colors.transparent,
      this.title = '',
      this.titleWidget,
      this.appBar,
      this.drawer,
      this.bottomNavigation,
      this.floatingActionButton,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
      this.resizeToAvoidBottomInset = true,
      this.safeTopArea = false,
      this.safeBottomArea = false,
      this.backgroundImage,
      this.backgroundColorGradient = const [],
      this.scaffoldKey,
      this.extendBodyBehindAppBar = true,
      this.floatingActionButtonLocation =
          FloatingActionButtonLocation.centerFloat,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColorGradient.isNotEmpty
          ? BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: backgroundColorGradient,
            ))
          : BoxDecoration(color: backgroundColor),
      child: SafeArea(
        top: safeTopArea,
        bottom: safeBottomArea,
        child: Scaffold(
            extendBody: true,
            key: scaffoldKey,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            bottomNavigationBar: bottomNavigation,
            drawer: drawer,
            backgroundColor: backgroundColorGradient.isEmpty
                ? backgroundColor
                : Colors.transparent,
            appBar: appBar ??
                (title.isNotEmpty
                    ? AppBar(
                        elevation: 0,
                        actionsIconTheme: IconThemeData(
                            color: backgroundColor == AppColors.background
                                ? AppColors.black
                                : null),
                        backgroundColor: appBarBackgroundColor,
                        iconTheme: IconThemeData(
                            color: backgroundColor == AppColors.background
                                ? AppColors.black
                                : null),
                        actions: actions,
                        title: titleWidget ??
                            AppText(
                              title,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    : AppBar(
                        forceMaterialTransparency: true,
                        elevation: 0,
                        actionsIconTheme: IconThemeData(
                            color: backgroundColor == AppColors.background
                                ? AppColors.black
                                : null),
                        iconTheme: IconThemeData(
                            color: backgroundColor == AppColors.background
                                ? AppColors.black
                                : null),
                      )),
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
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
                  child: body,
                ),
              ),
            )),
      ),
    );
  }
}
