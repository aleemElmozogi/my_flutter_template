part of 'app.dart';

extension AuthListener on MyTemplateApp {
  Future<void> _authStatus(BuildContext context, AuthState state) async {
    switch (state.authState) {
      case AuthStatus.authenticated:
        _appRouter.replaceAll([const MainShellRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          context.showAppSnackBar(
            message: S.of(context).loginSuccessMessage,
            type: snackBarContent.ContentType.success,
            title: S.of(context).loginTitle,
          );
        });
        break;
      case AuthStatus.unAuthenticated:
        _appRouter.replaceAll([LoginRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          context.showAppSnackBar(
            message: S.of(context).logoutSuccessMessage,
            type: snackBarContent.ContentType.success,
            title: S.of(context).logoutTitle,
          );
        });
        break;
    }
  }
}
