enum AccountState {
  active,
  inactive,
  resetPassword;

  bool get isActive => this == AccountState.active;
  bool get isResetPassword => this == AccountState.resetPassword;

  String toJson() => switch (this) {
    AccountState.active => 'active',
    AccountState.inactive => 'inactive',
    AccountState.resetPassword => 'resetPassword',
  };

  factory AccountState.fromJson(String value) => switch (value) {
    'active' => AccountState.active,
    'resetPassword' => AccountState.resetPassword,
    _ => AccountState.inactive,
  };
}
