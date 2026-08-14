enum AppFlavor {
  mock(diEnvironment: 'mock'),
  prod(diEnvironment: 'prod');

  const AppFlavor({required this.diEnvironment});

  final String diEnvironment;

  bool get isMock => this == AppFlavor.mock;
  bool get isProd => this == AppFlavor.prod;

  static AppFlavor fromValue(String value) {
    switch (value.toLowerCase()) {
      case 'prod':
      case 'production':
        return AppFlavor.prod;
      case 'mock':
      default:
        return AppFlavor.mock;
    }
  }
}

AppFlavor resolveCurrentFlavor() {
  const String appFlavor = String.fromEnvironment('APP_FLAVOR');
  const String flutterFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR');
  final String rawFlavor = appFlavor.isNotEmpty ? appFlavor : flutterFlavor;
  return AppFlavor.fromValue(rawFlavor);
}
