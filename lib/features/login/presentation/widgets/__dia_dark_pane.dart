part of 'login_screen.dart';

class _DiaDarkPane extends StatefulWidget {
  const _DiaDarkPane();

  @override
  State<_DiaDarkPane> createState() => _DiaDarkPaneState();
}

class _DiaDarkPaneState extends State<_DiaDarkPane> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.space8),
      decoration: BoxDecoration(
        color: AppConfig.isLive
            ? AppColors.neutral900
            : AppColors.primaryDevColor,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.radius52)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppDimensions.space32,
          AppDimensions.space32,
          AppDimensions.space32,
          AppDimensions.space16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dia Logo
            Text(
              AppConfig.appName,
              style: AppTheme.headlineMedium.copyWith(
                color: AppConfig.isLive
                    ? AppColors.neutral0
                    : AppColors.secondaryDevColor,
              ),
            ),
            const Spacer(),
            // Tagline and Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.space48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.tagline, style: AppTheme.tagline),
                  SizedBox(height: AppDimensions.space16),
                  Text(
                    AppStrings.subtitleTagline,
                    style: AppTheme.subtitleTagline,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Invitation text
            Center(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovering = true),
                onExit: (_) => setState(() => _isHovering = false),
                child: Text.rich(
                  TextSpan(
                    text: AppStrings.invitationText,
                    style: AppTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: AppStrings.here,
                        style: AppTheme.labelSmall.copyWith(
                          color: _isHovering ? AppColors.neutral0 : null,
                          decorationColor: _isHovering
                              ? AppColors.neutral0
                              : null,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => UrlService.launchUrlInSameTab(
                            AppConfig.isDiaForMeUrl,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
