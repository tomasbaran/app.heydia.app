import 'package:dia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Base text theme
  static TextTheme get _baseTextTheme => GoogleFonts.interTextTheme();

  // Custom text styles
  static TextStyle get headlineMedium => GoogleFonts.syncopate(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.neutral0,
    letterSpacing: 1.2,
  );

  static TextStyle get titleLarge => GoogleFonts.syncopate(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static TextStyle get titleMedium => GoogleFonts.syncopate(
    color: AppColors.neutral0,
    fontSize: 24,
    fontWeight: FontWeight.w300,
    letterSpacing: 1.5,
    height: 1.3,
  );

  static TextStyle get bodyLarge =>
      _baseTextTheme.bodyLarge?.copyWith(fontSize: 16) ??
      const TextStyle(fontSize: 16);

  static TextStyle get bodyMedium =>
      _baseTextTheme.bodyMedium?.copyWith(fontSize: 14) ??
      const TextStyle(fontSize: 14);

  static TextStyle get subtitle =>
      _baseTextTheme.bodyMedium?.copyWith(
        fontSize: 14,
        color: AppColors.neutral600,
      ) ??
      TextStyle(fontSize: 14, color: AppColors.neutral600);

  static TextStyle get bodySmall =>
      _baseTextTheme.bodySmall?.copyWith(
        fontSize: 14,
        color: AppColors.neutral400,
        fontWeight: FontWeight.w300,
      ) ??
      TextStyle(
        fontSize: 14,
        color: AppColors.neutral400,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get ctaTitle => TextStyle(
    color: AppColors.neutral0,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    height: 1.3,
  );

  static TextStyle get labelSmall =>
      _baseTextTheme.labelSmall?.copyWith(
        fontSize: 14,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.neutral400,
        decorationThickness: 1.0,
        fontWeight: FontWeight.w300,
        color: AppColors.neutral400,
      ) ??
      TextStyle(
        fontSize: 14,
        decoration: TextDecoration.underline,
        color: AppColors.neutral400,
        fontWeight: FontWeight.w300,
      );

  static final ThemeData light = ThemeData(
    textTheme: _baseTextTheme.copyWith(
      headlineMedium: headlineMedium,
      // Override Material Design text styles
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelSmall: labelSmall,
    ),
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: AppColors.neutral0,
  );
}
