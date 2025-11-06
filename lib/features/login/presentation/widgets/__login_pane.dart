part of 'login_screen.dart';

class _LoginPane extends StatelessWidget {
  const _LoginPane();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          Text(AppStrings.email, style: AppTheme.bodyMedium),
          SizedBox(height: AppDimensions.space8),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppDimensions.space12,
              ),
            ),
            style: AppTheme.bodyMedium,
          ),
          SizedBox(height: AppDimensions.space32),
          // Password Field
          Text(AppStrings.password, style: AppTheme.bodyMedium),
          SizedBox(height: AppDimensions.space8),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral900, width: 1.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppDimensions.space12,
              ),
            ),
            style: AppTheme.bodyMedium,
          ),
          SizedBox(height: AppDimensions.space48),
          // Login Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neutral0,
              foregroundColor: AppColors.neutral900,
              side: BorderSide(color: AppColors.neutral900, width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius8),
              ),
              padding: EdgeInsets.symmetric(vertical: AppDimensions.space16),
              elevation: 0,
            ),
            child: Text(AppStrings.login, style: AppTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
