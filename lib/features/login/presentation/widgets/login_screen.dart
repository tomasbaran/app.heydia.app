import 'package:dia_app/core/app_config.dart';
import 'package:dia_app/core/app_strings.dart';
import 'package:dia_app/core/services/url_service.dart';
import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/core/widgets/app_login_cta.dart';
import 'package:dia_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part '__dia_dark_pane.dart';
part '__login_pane.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isVerticalLayout = screenSize.height > screenSize.width;

    return Scaffold(
      body: isVerticalLayout
          ? Column(
              children: [
                // Top Panel - Dark Theme (vertical layout)
                Flexible(flex: 2, child: _DiaDarkPane()),
                // Bottom Panel - Light Theme (vertical layout)
                Flexible(flex: 1, child: _LoginPane(isVerticalLayout: true)),
              ],
            )
          : Row(
              children: [
                // Left Panel - Dark Theme (horizontal layout)
                Expanded(child: _DiaDarkPane()),
                // Right Panel - Light Theme (horizontal layout)
                SizedBox(
                  width: AppDimensions.paneWidth320,
                  child: _LoginPane(),
                ),
              ],
            ),
    );
  }
}
