part of 'app.dart';

extension AuthListener on MyTemplateApp {
  Future<void> _authStatus(BuildContext context, AuthState state) async {
    switch (state.authState) {
      case AuthStatus.authenticated:
        if (state.signInStatus == CallStatus.success) {
          // Login flow routing is handled by sign_in_listener after confirmation.
          return;
        }
        // final role = state.userEntity?.role;
        // if (role != null) {
        //   _appRouter.replaceAll([MainDashboardRoute(userRole: role)]);
        // }
        // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        //   context.showAppSnackBar(
        //     message: 'تم تسجيل الدخول بنجاح',
        //     type: snack_bar_content.ContentType.success,
        //     title: 'تسجيل الدخول',
        //   );
        // });
        break;
      case AuthStatus.unAuthenticated:
        _appRouter.replaceAll([LoginRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          context.showAppSnackBar(
            message: 'تم تسجيل الخروج بنجاح',
            type: snack_bar_content.ContentType.success,
            title: 'تسجيل الخروج',
          );
        });
        break;
    }
  }
}
