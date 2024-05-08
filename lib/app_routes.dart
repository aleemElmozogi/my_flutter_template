part of 'app.dart';

extension _Routes on _MyTemplateAppState {
  ///
  /// Declared Routes
  void _initRoutes() {
    usePathUrlStrategy();
    _router = GoRouter(
      initialLocation: AppRoute.root.toPath,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoute.login.toPath,
          name: AppRoute.login.toName,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: AppRoute.root.toPath,
          name: AppRoute.root.toName,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
      ],
    );
  }
}
