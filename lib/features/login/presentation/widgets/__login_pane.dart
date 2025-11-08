part of 'login_screen.dart';

class _LoginPane extends StatelessWidget {
  final bool isVerticalLayout;
  const _LoginPane({this.isVerticalLayout = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: isVerticalLayout ? AppDimensions.space0 : AppDimensions.space8,
        right: AppDimensions.space8,
        bottom: AppDimensions.space8,
        left: isVerticalLayout ? AppDimensions.space8 : AppDimensions.space0,
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
            AppLoginCta(onPressed: () {}, text: AppStrings.login),
          ],
        ),
      ),
    );
  }
}
