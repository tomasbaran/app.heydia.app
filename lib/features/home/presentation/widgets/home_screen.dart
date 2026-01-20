import 'package:dia_app/core/app_config.dart';
import 'package:dia_app/core/app_strings.dart';
import 'package:dia_app/core/theme/app_colors.dart';
import 'package:dia_app/core/theme/app_dimensions.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/core/widgets/app_nav_bar_item.dart';
import 'package:dia_app/core/widgets/app_pane_button.dart';
import 'package:dia_app/features/login/presentation/vm/auth_vm.dart';
import 'package:dia_app/features/login/presentation/widgets/login_screen.dart';
import 'package:dia_app/features/tasks/presentation/widgets/day_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '__planner_pane.dart';
part '__bottom_nav_bar.dart';
part '__user_pane.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                _BottomNavBar(),
              ],
            )
          : Row(
              children: [
                // User Panel (horizontal layout)
                SizedBox(width: AppDimensions.paneWidth280, child: _UserPane()),
                // Right Panel - Planner (horizontal layout)
                Expanded(child: _PlannerPane()),
              ],
            ),
    );
  }
}
