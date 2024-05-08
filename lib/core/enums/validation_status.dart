enum ValidationState {
  valid,
  invalid;

  bool get isValid => this == ValidationState.valid;
  bool get isInValid => this == ValidationState.invalid;
}
