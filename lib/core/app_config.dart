class AppConfig {
  static const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: 'unknown',
  );
  static String get appName => 'Dia ($flavor)';

  static bool get isDev => flavor == 'dev';
  static bool get isLive => flavor == 'live';
}
