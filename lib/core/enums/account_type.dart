enum AccountTypeStatus {
  merchant(2),
  customer(3);

  bool get isUser => this == AccountTypeStatus.customer;
  bool get isMerchant => this == AccountTypeStatus.merchant;
  const AccountTypeStatus(this.value);
  factory AccountTypeStatus.fromJson(int key) {
    switch (key) {
      case 2:
        return AccountTypeStatus.merchant;
      case 3:
        return AccountTypeStatus.customer;

      default:
        return AccountTypeStatus.customer;
    }
  }

  final int value;

  int toJson() => value;
}
