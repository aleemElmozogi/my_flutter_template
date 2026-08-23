enum TransactionState {
  pending(0),
  approved(1),
  rejected(2);

  const TransactionState(this.value);
  factory TransactionState.fromJson(int key) {
    switch (key) {
      case 0:
        return TransactionState.pending;
      case 1:
        return TransactionState.approved;
      case 2:
      default:
        return TransactionState.rejected;
    }
  }

  final int value;

  int toJson() => value;
}
