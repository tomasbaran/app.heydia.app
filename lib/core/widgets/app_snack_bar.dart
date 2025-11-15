import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum AppSnackBarAlignment { left, center, right }

enum AppSnackBarNotificationType { error, warning, success, info }

class AppSnackBar extends StatelessWidget {
  final String message;
  final Duration duration;
  final VoidCallback? onDismiss;
  final AppSnackBarNotificationType notificationType;

  const AppSnackBar({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 3),
    this.onDismiss,
    this.notificationType = AppSnackBarNotificationType.info,
  });

  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    AppSnackBarAlignment alignment = AppSnackBarAlignment.left,
    AppSnackBarNotificationType notificationType =
        AppSnackBarNotificationType.info,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => _AppSnackBarOverlay(
        message: message,
        duration: duration,
        alignment: alignment,
        notificationType: notificationType,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (notificationType) {
      case AppSnackBarNotificationType.error:
        backgroundColor = AppColors.errorColor;
        break;
      case AppSnackBarNotificationType.warning:
        backgroundColor = AppColors.warningColor;
        break;
      case AppSnackBarNotificationType.success:
        backgroundColor = AppColors.successColor;
        break;
      case AppSnackBarNotificationType.info:
        backgroundColor = AppColors.infoColor;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.space20,
        vertical: AppDimensions.space20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius52),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        message,
        style: AppTheme.bodyMedium.copyWith(color: AppColors.neutral0),
      ),
    );
  }
}

class _AppSnackBarOverlay extends StatefulWidget {
  final String message;
  final Duration duration;
  final AppSnackBarAlignment alignment;
  final AppSnackBarNotificationType notificationType;
  final VoidCallback onDismiss;

  const _AppSnackBarOverlay({
    required this.message,
    required this.duration,
    required this.alignment,
    required this.notificationType,
    required this.onDismiss,
  });

  @override
  State<_AppSnackBarOverlay> createState() => _AppSnackBarOverlayState();
}

class _AppSnackBarOverlayState extends State<_AppSnackBarOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Auto-dismiss after duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) {
            widget.onDismiss();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final snackBarWidth = AppDimensions.paneWidth280;

    double leftOffset;
    switch (widget.alignment) {
      case AppSnackBarAlignment.left:
        leftOffset = AppDimensions.space24;
        break;
      case AppSnackBarAlignment.center:
        leftOffset = (screenWidth - snackBarWidth) / 2;
        break;
      case AppSnackBarAlignment.right:
        leftOffset = screenWidth - snackBarWidth - AppDimensions.space24;
        break;
    }

    return Positioned(
      bottom: AppDimensions.space24, // 16px from bottom
      left: leftOffset,
      child: IgnorePointer(
        ignoring: false,
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                width: snackBarWidth,
                child: AppSnackBar(
                  message: widget.message,
                  duration: widget.duration,
                  notificationType: widget.notificationType,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
