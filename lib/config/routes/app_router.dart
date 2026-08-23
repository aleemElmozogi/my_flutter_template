import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/features/authenticated/home/presentation/screens/home_screen.dart';
import 'package:my_flutter_template/features/authenticated/main/presentation/screens/main_shell_screen.dart';
import 'package:my_flutter_template/features/authenticated/notifications/presentation/screens/notifications_screen.dart';
import 'package:my_flutter_template/features/authenticated/profile/presentation/screens/profile_screen.dart';
import 'package:my_flutter_template/features/startUp/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/screens/auth_page.dart';
import 'package:my_flutter_template/features/startUp/splash/presentation/screens/splash_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(
    // required AuthGuard authGuard,
    // required SoftGuard softGuard,
    // required OtpGuard otpGuard,
    // // required ChangePasswordGuard changePasswordGuard
  ) : // _authGuard = authGuard,
      //         _softGuard = softGuard,
      //         _otpGuard = otpGuard,
      //         // _changePasswordGuard = changePasswordGuard,
      super();
  // final AuthGuard _authGuard;
  // final SoftGuard _softGuard;
  // final OtpGuard _otpGuard;
  // // final ChangePasswordGuard _changePasswordGuard;
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  // is first open
  bool isFirstOpen = true;
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(
      page: MainShellRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: NotificationsRoute.page, path: 'notifications'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // _authGuard,
    // _changePasswordGuard,
  ];
}
