import 'dart:async';

import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';

final class TaskRepoImpl implements TaskRepoInterface {
  TaskRepoImpl();

  @override
  Stream<List<Item>> subscribeToTasksByDate(DateTime date) {
    final streamController = StreamController<List<Item>>.broadcast();

    streamController.onListen = () {
      streamController.add([
        Item.task(
          id: '$date',
          title: 'Task $date',
          isCompleted: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]);
    };

    return streamController.stream;
  }
}
