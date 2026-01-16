import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepoInterface>(),
  MockSpec<TaskRepoInterface>(),
])
void main() {}
