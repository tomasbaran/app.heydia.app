import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  static const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: 'unknown',
  );

  // Version is automatically read from pubspec.yaml via package_info_plus
  static String? _version;
  static String? _buildNumber;
  static String get fullVersion =>
      '$_version+$_buildNumber'; // Fallback if not initialized

  /// Initialize the version from package info. Should be called early in app startup.
  static Future<void> initialize() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
  }

  static String get appName => isLive ? 'Dia' : 'Dia $fullVersion ($flavor)';
  static bool get isDev => flavor == 'dev';
  static bool get isLive => flavor == 'live';

  static String get isDiaForMeUrl => 'https://form.typeform.com/to/JHAvzNQy';

  // Mobile breakpoint
  static const double mobileBreakpoint = 768;
}
