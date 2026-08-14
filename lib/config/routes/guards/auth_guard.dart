import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';

@lazySingleton
class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._localStorage, this._authCubit);

  final LocalStorage _localStorage;
  final AuthCubit _authCubit;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final accessToken = await _localStorage.accessToken;
    if (accessToken.isNotEmpty) {
      // await _authCubit.restoreSession();
      resolver.next(true);
      return;
    }

    router.replaceAll([LoginRoute()]);
    resolver.next(false);
  }
}

@lazySingleton
class GuestGuard extends AutoRouteGuard {
  GuestGuard(this._localStorage, this._authCubit);

  final LocalStorage _localStorage;
  final AuthCubit _authCubit;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final accessToken = await _localStorage.accessToken;
    if (accessToken.isEmpty) {
      resolver.next(true);
      return;
    }

    // await _authCubit.restoreSession();
    // final role =
    //     _authCubit.state.userEntity?.role ?? await _localStorage.savedUserRole;
    // if (role == null) {
    //   router.replaceAll([LoginRoute()]);
    //   resolver.next(false);
    //   return;
    // }
    // router.replaceAll([MainDashboardRoute(userRole: role)]);
    resolver.next(false);
  }
}
