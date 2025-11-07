import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppCta extends StatefulWidget {
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
  State<AppCta> createState() => _AppCtaState();
}

class _AppCtaState extends State<AppCta> {
  bool _isHovered = false;
  bool _isPressed = false;

  double get _verticalOffset {
    if (_isPressed) return 2.0; // Move down when pressed
    if (_isHovered) return -2.0; // Move up when hovered
    return 0.0; // Normal position
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _verticalOffset, 0),
          child: ElevatedButton(
            onPressed: widget.enabled ? widget.onPressed : null,
            style:
                widget.style ??
                ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neutral900,
                  foregroundColor: AppColors.neutral0,
                  disabledBackgroundColor: AppColors.disabledColor,
                  disabledForegroundColor: AppColors.disabledColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radius16),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.space28,
                  ),
                  elevation: 0,
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
            child: widget.child ?? Text(widget.text!, style: AppTheme.ctaTitle),
          ),
        ),
      ),
    );
  }
}
