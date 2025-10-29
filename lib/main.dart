import 'package:dia_app/core/app_config.dart';
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
      home: Scaffold(body: Center(child: Text('Hi, ${AppConfig.appName}!'))),
    );
  }
}
