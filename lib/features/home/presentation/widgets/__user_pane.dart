part of 'home_screen.dart';

class _UserPane extends StatelessWidget {
  const _UserPane({required this.userEmail});

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.space8,
        left: AppDimensions.space8,
        bottom: AppDimensions.space8,
        right: AppDimensions.space0,
      ),
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
            // App Title
            Text(
              AppConfig.appName,
              style: AppTheme.headlineMedium.copyWith(
                color: AppConfig.isLive
                    ? AppColors.neutral0
                    : AppColors.secondaryDevColor,
              ),
            ),
            const Spacer(),
            // User Email and Log Out Button at the bottom
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userEmail,
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppConfig.isLive
                        ? AppColors.neutral0
                        : AppColors.secondaryDevColor,
                  ),
                ),
                SizedBox(height: AppDimensions.space16),
                AppPaneButton(
                  onTap: () async {
                    await context.read<LoginVM>().logout();
                    // Navigate back to login screen
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    }
                  },
                  label: AppStrings.logOut,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
