import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/pages/auth_page.dart';
import 'package:my_flutter_template/features/startUp/splash/presentation/screens/splash_screen.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';


@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this._authGuard, this._guestGuard);

  final AuthGuard _authGuard;
  final GuestGuard _guestGuard;

  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    duration: const Duration(milliseconds: 180),
    reverseDuration: const Duration(milliseconds: 140),
  );

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page, guards: [_guestGuard]),

  ];
}
