part of 'login_screen.dart';

class _LoginPane extends StatelessWidget {
  const _LoginPane();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.space8,
        right: AppDimensions.space8,
        bottom: AppDimensions.space8,
        left: AppDimensions.space0,
      ),
      decoration: BoxDecoration(
        color: AppColors.neutral300,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.radius52)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.space40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email Field
            AppTextFormField(hintText: AppStrings.email),
            SizedBox(height: AppDimensions.space16),
            // Password Field
            AppTextFormField(obscureText: true, hintText: AppStrings.password),
            SizedBox(height: AppDimensions.space24),
            // Login Button
            AppCta(onPressed: () {}, text: AppStrings.login),
          ],
        ),
      ),
    );
  }
}
