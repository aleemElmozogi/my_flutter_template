class AppEnvironment {
  const AppEnvironment._();

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.example.invalid',
  );

  static const _apiSpkiSha256Pins = String.fromEnvironment(
    'API_SPKI_SHA256_PINS',
  );

  static const googleMapsApiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');

  static const aiApiKey = String.fromEnvironment('AI_API_KEY');

  static List<String> get apiSpkiSha256Pins => _apiSpkiSha256Pins
      .split(',')
      .map((pin) => pin.trim())
      .where((pin) => pin.isNotEmpty)
      .toList(growable: false);
}
