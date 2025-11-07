import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
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
        obscureText: widget.obscureText,
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        minLines: widget.obscureText ? 1 : widget.minLines,
        style: widget.style ?? AppTheme.bodyMedium,
        decoration: (widget.decoration ?? InputDecoration()).copyWith(
          filled: widget.decoration?.filled ?? true,
          fillColor:
              widget.decoration?.fillColor ??
              (_isHovered ? AppColors.neutral0 : AppColors.neutral200),
          hintText: widget.decoration?.hintText ?? widget.hintText,
          hintStyle:
              widget.decoration?.hintStyle ??
              widget.hintStyle ??
              AppTheme.bodyMedium.copyWith(color: AppColors.neutral600),
          border:
              widget.decoration?.border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius16),
                borderSide: BorderSide.none,
              ),
          enabledBorder:
              widget.decoration?.enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius16),
                borderSide: BorderSide.none,
              ),
          focusedBorder:
              widget.decoration?.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius16),
                borderSide: BorderSide.none,
              ),
          contentPadding:
              widget.decoration?.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: AppDimensions.space16,
                vertical: AppDimensions.space20,
              ),
        ),
      ),
    );
  }
}
