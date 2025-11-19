import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

class AppConfig {
  static const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: 'unknown',
  );

  // Version is automatically read from pubspec.yaml via package_info_plus
  static String? _version;
  static String? _buildNumber;

  static String get fullVersion {
    final version = _version ?? 'v?';
    final buildNumber = _buildNumber ?? '?';
    return '$version+$buildNumber';
  }

  /// Initialize the version from package info. Should be called early in app startup.
  static Future<void> initialize() async {
    try {
      if (kIsWeb) {
        // On web: fetch version.json manually from the same origin
        final uri = Uri.parse(
          'version.json',
        ); // relative → https://devapp.heydia.app/version.json
        final resp = await http.get(uri);

        if (resp.statusCode == 200) {
          final data = jsonDecode(resp.body) as Map<String, dynamic>;
          _version = data['version'] as String?;
          _buildNumber = data['build_number'] as String?;
        } else {
          debugPrint(
            'AppConfig: failed to load version.json '
            '(status ${resp.statusCode})',
          );
        }
      } else {
        // Mobile / desktop → use the plugin as usual
        final packageInfo = await PackageInfo.fromPlatform();
        _version = packageInfo.version;
        _buildNumber = packageInfo.buildNumber;
      }
    } catch (e, st) {
      debugPrint('Error initializing app config: $e\n$st');
      // Fallback: _version / _buildNumber stay null
    }
  }

  static String get appName => isLive ? 'Dia' : 'Dia $fullVersion ($flavor)';
  static bool get isDev => flavor == 'dev';
  static bool get isLive => flavor == 'live';

  static String get isDiaForMeUrl => 'https://form.typeform.com/to/JHAvzNQy';

  // Mobile breakpoint
  static const double mobileBreakpoint = 768;
}
