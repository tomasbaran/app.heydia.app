import 'dart:async';

import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';

final class TaskRepoImpl implements TaskRepoInterface {
  TaskRepoImpl();

  @override
  Stream<Result<List<Item>>> watchTasksByDate(DateTime date) {
    return Stream.value(
      Result.ok([
        Item.task(
          id: '1',
          title: 'Task 1',
          isCompleted: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]),
    );
  }
}
