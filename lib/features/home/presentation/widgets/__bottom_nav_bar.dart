part of 'home_screen.dart';

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    final userEmail = context.watch<AuthVM>().userEmail;

    return Container(
      margin: EdgeInsets.fromLTRB(
        AppDimensions.space8,
        AppDimensions.space0,
        AppDimensions.space8,
        AppDimensions.space8,
      ),
      decoration: BoxDecoration(
        color: AppConfig.isLive
            ? AppColors.neutral900
            : AppColors.primaryDevColor,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.radius52)),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.space8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                userEmail,
                style: AppTheme.bodyMedium.copyWith(
                  color: AppConfig.isLive
                      ? AppColors.neutral0
                      : AppColors.secondaryDevColor,
                ),
              ),
            ),
            SizedBox(width: AppDimensions.space16),
            AppNavBarItem(
              onTap: () async {
                await context.read<AuthVM>().logout();
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
      ),
    );
  }
}
