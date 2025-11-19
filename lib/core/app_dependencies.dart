import 'package:dia_app/features/login/data/repo_implementations/auth_repo_impl.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:dia_app/features/login/presentation/vm/auth_vm.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Centralized dependency injection container
///
/// All app dependencies are created and wired up here.
/// Use `.prod()` factory for production dependencies.
/// Access dependencies throughout the app via Provider: `context.read<AppDependencies>()`
class AppDependencies {
  final FirebaseAuth firebaseAuth;
  final AuthRepoInterface authRepo;

  AppDependencies._({required this.firebaseAuth, required this.authRepo});

  factory AppDependencies.prod() {
    final fb = FirebaseAuth.instance;
    return AppDependencies._(firebaseAuth: fb, authRepo: AuthRepoImpl(fb));
  }

  factory AppDependencies.test({
    FirebaseAuth? firebaseAuth,
    AuthRepoInterface? authRepo,
  }) {
    final fb = firebaseAuth ?? FirebaseAuth.instance; // or FakeFirebaseAuth()
    return AppDependencies._(
      firebaseAuth: fb,
      authRepo: authRepo ?? AuthRepoImpl(fb),
    );
  }

  AuthVM createAuthVM() => AuthVM(authRepo);
}
