part of 'login_screen.dart';

class _LoginPane extends StatefulWidget {
  final bool isVerticalLayout;
  const _LoginPane({this.isVerticalLayout = false});

  @override
  State<_LoginPane> createState() => _LoginPaneState();
}

class _LoginPaneState extends State<_LoginPane> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.isVerticalLayout
            ? AppDimensions.space0
            : AppDimensions.space8,
        right: AppDimensions.space8,
        bottom: AppDimensions.space8,
        left: widget.isVerticalLayout
            ? AppDimensions.space8
            : AppDimensions.space0,
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
            AppTextFormField(
              hintText: AppStrings.email,
              controller: _emailController,
            ),
            SizedBox(height: AppDimensions.space16),
            // Password Field
            AppTextFormField(
              obscureText: true,
              hintText: AppStrings.password,
              controller: _passwordController,
            ),
            SizedBox(height: AppDimensions.space24),
            ValueListenableBuilder<CommandState<User?>>(
              valueListenable: context.read<LoginVM>().loginCommand.state,
              builder: (context, loginState, child) {
                return AppLoginCta(
                  isLoading: loginState is Executing<User?>,
                  onPressed: loginState is Executing<User?>
                      ? () {}
                      : () => _handleLogin(),
                  text: AppStrings.login,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    await context.read<LoginVM>().loginCommand.execute((
      _emailController.text.trim(),
      _passwordController.text,
    ));
    if (!mounted) return;
    final loginState = context.read<LoginVM>().loginCommand.state.value;
    if (loginState is Succeeded<User?>) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(loginVM: context.read<LoginVM>()),
        ),
      );
    } else if (loginState is Failed<User?>) {
      AppSnackBar.show(
        context,
        message: loginState.message,
        alignment: AppSnackBarAlignment.right,
        notificationType: AppSnackBarNotificationType.error,
      );
    }
  }
}
