enum EnvironmentType {
  mock,
  production;

  bool get isMock => this == EnvironmentType.mock;
  bool get isProduction => this == EnvironmentType.production;

  String get name => isMock? 'mock': 'prod';
}
