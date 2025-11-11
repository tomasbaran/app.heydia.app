import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  const AppTextFormField({
    required this.hintText,
    this.controller,
    super.key,
    this.obscureText = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        maxLines: widget.obscureText ? 1 : null,
        minLines: widget.obscureText ? 1 : null,
        style: AppTheme.bodyMedium,
        decoration: InputDecoration(
          filled: true,
          fillColor: _isHovered ? AppColors.neutral0 : AppColors.neutral200,
          hintText: widget.hintText,
          hintStyle: AppTheme.bodyMedium.copyWith(color: AppColors.neutral600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.space16,
            vertical: AppDimensions.space20,
          ),
        ),
      ),
    );
  }
}
