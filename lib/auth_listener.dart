part of 'app.dart';

extension AuthListener on MyTemplateApp {
  Future<void> _authStatus(BuildContext context, AuthState state) async {
    switch (state.authState) {
      case AuthStatus.authenticated:
        _appRouter.replaceAll([const MainRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          context.showAppSnackBar(
            message: 'تم تسجيل الدخول بنجاح',
            type: snackBarContent.ContentType.success,
            title: 'تسجيل الدخول',
          );
        });
        break;
      case AuthStatus.unAuthenticated:
        _appRouter.replaceAll([LoginRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          context.showAppSnackBar(
            message: 'تم تسجيل الخروج بنجاح',
            type: snackBarContent.ContentType.success,
            title: 'تسجيل الخروج',
          );
        });
        break;
    }
  }
}
