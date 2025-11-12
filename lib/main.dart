import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/features/home/presentation/widgets/home_screen.dart';
import 'package:dia_app/features/login/presentation/widgets/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void runMainApp(FirebaseOptions firebaseOptions) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginScreen(),
      // home: HomeScreen(loginVM: LoginVM(AuthRepoImpl(FirebaseAuth.instance))),
    );
  }
}
