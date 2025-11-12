import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppLoginCta extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String text;

  const AppLoginCta({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });

  @override
  State<AppLoginCta> createState() => _AppLoginCtaState();
}

class _AppLoginCtaState extends State<AppLoginCta> {
  bool _isHovered = false;
  bool _isPressed = false;

  double get _verticalOffset {
    if (_isPressed) return 2.0; // Move down when pressed
    if (_isHovered) return -2.0; // Move up when hovered
    return 0.0; // Normal position
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MouseRegion(
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
              onPressed: widget.onPressed,
              style:
                  ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neutral900,
                    foregroundColor: AppColors.neutral0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius16,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.space28,
                    ),
                    elevation: 0,
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.space8),
                child: widget.isLoading
                    ? const CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.neutral0,
                        ),
                        backgroundColor: AppColors.neutral0,
                      )
                    : Text(widget.text, style: AppTheme.ctaTitle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
