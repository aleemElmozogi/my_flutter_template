enum AuthStatus {
  authenticated,
  unAuthenticated;


  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isUnAuthenticated => this == AuthStatus.unAuthenticated;

}
