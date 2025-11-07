import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppCta extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final ButtonStyle? style;
  final bool enabled;

  const AppCta({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.style,
    this.enabled = true,
  }) : assert(
          text != null || child != null,
          'Either text or child must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.neutral900,
            foregroundColor: AppColors.neutral0,
            disabledBackgroundColor: AppColors.neutral400,
            disabledForegroundColor: AppColors.neutral0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
            ),
            padding: EdgeInsets.symmetric(vertical: AppDimensions.space16),
            elevation: 0,
          ),
      child: child ?? Text(text!, style: AppTheme.bodyMedium),
    );
  }
}

