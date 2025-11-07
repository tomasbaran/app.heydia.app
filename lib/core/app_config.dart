class AppConfig {
  static const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: 'unknown',
  );
  static String get appName => isLive ? 'Dia' : 'Dia ($flavor)';
  static bool get isDev => flavor == 'dev';
  static bool get isLive => flavor == 'live';

  static String get isDiaForMeUrl => 'https://form.typeform.com/to/JHAvzNQy';

  // Mobile breakpoint
  static const double mobileBreakpoint = 768;
}
