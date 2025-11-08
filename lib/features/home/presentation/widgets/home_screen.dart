import 'package:dia_app/core/app_config.dart';
import 'package:dia_app/core/app_strings.dart';
import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/core/widgets/app_nav_bar_item.dart';
import 'package:dia_app/core/widgets/app_pane_button.dart';
import 'package:dia_app/features/login/presentation/vm/login_vm.dart';
import 'package:dia_app/features/login/presentation/widgets/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part '__planner_pane.dart';
part '__bottom_nav_bar.dart';
part '__user_pane.dart';

class HomeScreen extends StatelessWidget {
  final LoginVM loginVM;

  const HomeScreen({super.key, required this.loginVM});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? '';
    final screenSize = MediaQuery.of(context).size;
    final isVerticalLayout = screenSize.height > screenSize.width;

    return Scaffold(
      body: isVerticalLayout
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Panel - Planner (vertical layout)
                Expanded(child: _PlannerPane()),
                // Bottom Navigation Bar (vertical layout)
                _BottomNavBar(userEmail: userEmail, loginVM: loginVM),
              ],
            )
          : Row(
              children: [
                // User Panel (horizontal layout)
                SizedBox(
                  width: AppDimensions.paneWidth280,
                  child: _UserPane(userEmail: userEmail, loginVM: loginVM),
                ),
                // Right Panel - Planner (horizontal layout)
                Expanded(child: _PlannerPane()),
              ],
            ),
    );
  }
}
