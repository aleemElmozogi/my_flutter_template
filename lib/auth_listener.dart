part of 'app.dart';

extension AuthListener on _MyTemplateAppState {
  Future<void> _authStatus(BuildContext context, AuthState state) async {
    switch (state.authState) {
      case AuthStatus.authenticated:
        // _router.replace(AppRoute.home.toPath);
        // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        //   _router.routerDelegate.navigatorKey.currentContext
        //       ?.showSuccessDialog(message: 'تم تسحيل الدخول بنجاح');
        // });
        break;
      case AuthStatus.unAuthenticated:
        _router.goNamed(AppRoute.login.toName);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _router.routerDelegate.navigatorKey.currentContext
              ?.showSuccessDialog(message: 'تم تسحيل الخروج بنجاح');
        });
        break;
    }
  }
}
