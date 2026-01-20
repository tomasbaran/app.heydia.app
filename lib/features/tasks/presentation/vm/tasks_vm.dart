import 'dart:async';

import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/core/utils/date_utils.dart';
import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';
import 'package:flutter/foundation.dart';

class TasksVM extends ChangeNotifier {
  TasksVM({required this.taskRepo});
  final TaskRepoInterface taskRepo;

  final Map<DateTime, List<Item>> _dailyTasksMap = {};
  final Map<DateTime, StreamSubscription<Result<List<Item>>>>
  _subscriptionsMap = {};

  Map<DateTime, List<Item>> get loadedDailyTasks => _dailyTasksMap;

  late final StreamCommand<List<Item>, DateTime> _tasksCommandByDate =
      StreamCommand(watch: (date) => taskRepo.watchTasksByDate(date));

  StreamCommand<List<Item>, DateTime> get tasksCommandByDate =>
      _tasksCommandByDate;

  /// Subscribes to tasks for a specific date
  ///
  /// The stream will automatically update [loadedDailyTasks] whenever tasks
  /// are added, updated, or deleted in Firestore.
  ///
  /// Returns true if a new subscription was started, false if an existing
  /// subscription was re-used.
  bool watchTasksByDate(DateTime date) {
    final normalizedDate = DateUtils.normalizeToDay(date);

    // Already watching this date → no-op
    if (_subscriptionsMap[normalizedDate] != null) {
      return false; // subscription already active
    }

    _subscriptionsMap[normalizedDate] = _tasksCommandByDate.watch(
      normalizedDate,
    );
    return true; // subscription started
  }

  /// Stops watching tasks for a specific date
  ///
  /// Use this when:
  /// - Navigating away from a date view
  /// - Limiting active subscriptions to save resources
  /// - Implementing a "keep only N dates subscribed" strategy
  void stopWatchingTasksByDate(DateTime date) {
    final normalizedDate = DateUtils.normalizeToDay(date);
    _subscriptionsMap[normalizedDate]?.cancel();
    _subscriptionsMap.remove(normalizedDate);
    _dailyTasksMap.remove(normalizedDate);
    notifyListeners();
  }

  @override
  void dispose() {
    // Cancel all subscriptions when the VM is disposed
    // This prevents memory leaks and stops Firestore listeners
    for (final subscription in _subscriptionsMap.values) {
      subscription.cancel();
    }
    _subscriptionsMap.clear();
    super.dispose();
  }
}
