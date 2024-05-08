import 'package:my_flutter_template/config/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension AppNavigationExtension on BuildContext {
  void goReplace(AppRoute route, {Object? extra}) =>
      GoRouter.of(this).replace(route.toPath, extra: extra);
  void goName(AppRoute route, {Object? extra}) =>
      GoRouter.of(this).pushNamed(route.toName, extra: extra);
  void goNamedReset(AppRoute route, {Object? extra}) =>
      GoRouter.of(this).goNamed(route.toName, extra: extra);
  void goPath(AppRoute path, {Object? extra}) =>
      GoRouter.of(this).push(path.toPath, extra: extra);
  void goPop() => GoRouter.of(this).pop();
}
