enum AppRoute {
  root,
  login,
}

extension AppPageExtension on AppRoute {
  String get toPath {
    switch (this) {
      default:
        return '/${toString().split('.').last}';
    }
  }

  String get toSubPath {
    switch (this) {
      default:
        return toString().split('.').last;
    }
  }

  String get toName {
    switch (this) {
      default:
        return toString().split('.').last;
    }
  }
}
