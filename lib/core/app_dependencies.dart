import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/features/login/data/repo_implementations/auth_repo_impl.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:dia_app/features/login/presentation/vm/auth_vm.dart';
import 'package:dia_app/features/tasks/data/repo_implementations/task_repo_impl.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';
import 'package:dia_app/features/tasks/presentation/vm/tasks_vm.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Centralized dependency injection container
///
/// All app dependencies are created and wired up here.
/// Use `.prod()` factory for production dependencies.
/// Access dependencies throughout the app via Provider: `context.read<AppDependencies>()`
class AppDependencies {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final AuthRepoInterface authRepo;
  final TaskRepoInterface taskRepo;

  AppDependencies._({
    required this.firebaseAuth,
    required this.firestore,
    required this.authRepo,
    required this.taskRepo,
  });

  factory AppDependencies.prod() {
    final fbAuthInstance = FirebaseAuth.instance;
    final firestoreInstance = FirebaseFirestore.instance;
    return AppDependencies._(
      firebaseAuth: fbAuthInstance,
      firestore: firestoreInstance,
      authRepo: AuthRepoImpl(fbAuthInstance),
      taskRepo: TaskRepoImpl(),
    );
  }

  factory AppDependencies.test({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
    AuthRepoInterface? authRepo,
    TaskRepoInterface? taskRepo,
  }) {
    final fb = firebaseAuth ?? FirebaseAuth.instance; // or FakeFirebaseAuth()
    final fs = firestore ?? FirebaseFirestore.instance;
    return AppDependencies._(
      firebaseAuth: fb,
      firestore: fs,
      authRepo: authRepo ?? AuthRepoImpl(fb),
      taskRepo: taskRepo ?? TaskRepoImpl(),
    );
  }

  AuthVM createAuthVM() => AuthVM(authRepo);

  TasksVM createTasksVM() => TasksVM(taskRepo: taskRepo);
}
