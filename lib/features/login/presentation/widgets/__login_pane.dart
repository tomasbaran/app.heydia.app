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
  bool _isLoading = false;

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
            // Login Button
            AppLoginCta(
              onPressed: _isLoading
                  ? () {}
                  : () {
                      _handleLogin();
                    },
              text: AppStrings.login,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (_isLoading) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final loginVM = context.read<LoginVM>();
      final result = await loginVM.loginCommand.execute((email, password));

      if (!mounted) return;

      switch (result) {
        case Ok():
          // Navigate to home screen on success
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeScreen(loginVM: loginVM)),
          );
        case Error(:final message):
          // Handle error - show a snackbar with error message
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
