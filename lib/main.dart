import 'package:dia_app/core/app_dependencies.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/features/login/presentation/vm/login_vm.dart';
import 'package:dia_app/features/login/presentation/widgets/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void runMainApp(FirebaseOptions firebaseOptions) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);

  final deps = AppDependencies.prod();

  runApp(
    Provider<AppDependencies>.value(
      value: deps,
      child: ChangeNotifierProvider<LoginVM>(
        create: (context) => context.read<AppDependencies>().createLoginVM(),
        child: const DiaApp(),
      ),
    ),
  );
}

class DiaApp extends StatelessWidget {
  const DiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginScreen(),
      // home: const HomeScreen(),
    );
  }
}
