part of 'login_screen.dart';

class _DiaDarkPane extends StatelessWidget {
  const _DiaDarkPane();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.space8),
      decoration: const BoxDecoration(
        color: AppColors.neutral900,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.radius52)),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.space24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dia Logo
            Text(AppStrings.dia, style: AppTheme.headlineMedium),
            const Spacer(),
            // Tagline
            Center(
              child: Text(
                AppStrings.tagline,
                textAlign: TextAlign.center,
                style: AppTheme.titleMedium,
              ),
            ),
            const Spacer(),
            // Invitation text
            Center(
              child: Text.rich(
                TextSpan(
                  text: AppStrings.invitationText,
                  style: AppTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: AppStrings.here,
                      style: AppTheme.labelSmall,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => UrlService.launchUrlInSameTab(
                          AppConfig.isDiaForMeUrl,
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
