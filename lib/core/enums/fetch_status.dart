enum CallStatus {
  pure,
  inProgress,
  failed,
  success;

  bool get isPure => this == CallStatus.pure;
  bool get isInProgress => this == CallStatus.inProgress;
  bool get isFailed => this == CallStatus.failed;
  bool get isSucceeded => this == CallStatus.success;
}
