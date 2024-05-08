part of '../pages/auth_page.dart';

extension SignInListener on LoginScreen {
  Future<void> _parseSignInStatus(BuildContext context, AuthState state) async {
    switch (state.signInStatus) {
      case CallStatus.pure:
        break;
      case CallStatus.failed:
        context.showErrorDialog(state.message);
        break;
      case CallStatus.success:
        //Route to the home page
        break;
      default:
        break;
    }
  }
}
