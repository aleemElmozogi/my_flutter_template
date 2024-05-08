enum ResultType {
  none,
  success,
  failure,
  techError,
  unauthorized;

  bool get isSuccess => this == ResultType.success;
  bool get isFailure => this == ResultType.failure;
  bool get isServerError => this == ResultType.techError;
  bool get isUnauthorized => this == ResultType.unauthorized;
}
