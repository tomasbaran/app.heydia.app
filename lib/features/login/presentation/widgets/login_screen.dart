import 'package:dia_app/core/app_config.dart';
import 'package:dia_app/core/app_strings.dart';
import 'package:dia_app/core/services/url_service.dart';
import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part '__dia_dark_pane.dart';
part '__login_pane.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Panel - Dark Theme
          const Expanded(flex: 2, child: _DiaDarkPane()),
          // Right Panel - Light Theme
          const Expanded(flex: 1, child: _LoginPane()),
        ],
      ),
    );
  }
}
