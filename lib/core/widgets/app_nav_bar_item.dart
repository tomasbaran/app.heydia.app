import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppNavBarItem extends StatefulWidget {
  final VoidCallback? onTap;
  final String label;

  const AppNavBarItem({super.key, this.onTap, required this.label});

  @override
  State<AppNavBarItem> createState() => _AppNavBarItemState();
}

class _AppNavBarItemState extends State<AppNavBarItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color get _effectiveBackgroundColor {
    if (_isHovered) {
      return AppColors.neutral100.withValues(alpha: 0.8);
    }
    return AppColors.neutral100;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) {
          _animationController.reverse();
          widget.onTap?.call();
        },
        onTapCancel: () => _animationController.reverse(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.space16,
            vertical: AppDimensions.space16,
          ),
          decoration: BoxDecoration(
            color: _effectiveBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radius24),
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Text(widget.label, style: AppTheme.paneButtonLabel),
          ),
        ),
      ),
    );
  }
}
