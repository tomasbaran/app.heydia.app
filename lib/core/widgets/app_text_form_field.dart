import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool enabled;
  final int? maxLines;
  final int? minLines;

  const AppTextFormField({
    super.key,
    this.obscureText = false,
    this.hintText,
    this.hintStyle,
    this.style,
    this.decoration,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      minLines: obscureText ? 1 : minLines,
      style: style ?? AppTheme.bodyMedium,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            fillColor: AppColors.neutral0,
            hintText: hintText,
            hintStyle: hintStyle ??
                AppTheme.bodyMedium.copyWith(
                  color: AppColors.neutral400,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.space16,
              vertical: AppDimensions.space12,
            ),
          ),
    );
  }
}

