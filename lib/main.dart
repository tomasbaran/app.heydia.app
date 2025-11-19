import 'package:dia_app/core/app_config.dart';
import 'package:dia_app/core/app_dependencies.dart';
import 'package:dia_app/core/theme/app_theme.dart';
import 'package:dia_app/features/login/presentation/vm/auth_vm.dart';
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
      child: ChangeNotifierProvider<AuthVM>(
        create: (context) => context.read<AppDependencies>().createAuthVM(),
        child: const DiaApp(),
      ),
    ),
  );
}

class DiaApp extends StatefulWidget {
  const DiaApp({super.key});

  @override
  State<DiaApp> createState() => _DiaAppState();
}

class _DiaAppState extends State<DiaApp> {
  late final Future<void> _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = AppConfig.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializationFuture,
      builder: (context, snapshot) {
        // Show a loading indicator while initializing
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const LoginScreen(),
          // home: const HomeScreen(),
        );
      },
    );
  }
}
