class AppEnvironment {
  const AppEnvironment._();

  static const googleMapsApiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');

  static const aiApiKey = String.fromEnvironment('AI_API_KEY');
}
