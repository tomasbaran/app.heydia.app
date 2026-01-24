import 'dart:async';

import 'package:dia_app/core/utils/dia_date_utils.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';
import 'package:flutter/foundation.dart';

class TasksVM extends ChangeNotifier {
  TasksVM({required TaskRepoInterface taskRepo}) : _taskRepo = taskRepo;
  final TaskRepoInterface _taskRepo;

  final Map<DateTime, List<Item>> _tasksByDate = {};
  Map<DateTime, List<Item>> get tasksByDate => _tasksByDate;

  final Map<DateTime, StreamSubscription<List<Item>>>
  _tasksSubscriptionsByDate = {};

  /// Subscribes to tasks for a specific date
  ///
  /// The stream will automatically update [tasksByDate] whenever tasks
  /// are added, updated, or deleted in Firestore.
  ///
  /// Returns true if a new subscription was started, false if an existing
  /// subscription was re-used.
  bool subscribeToTasksByDate(DateTime date) {
    final normalizedDate = DiaDateUtils.normalizeToDay(date);

    // Already subscribed to this date → no-op
    if (_tasksSubscriptionsByDate[normalizedDate] != null) {
      return false; // subscription already active
    }

    _tasksSubscriptionsByDate[normalizedDate] = _taskRepo
        .subscribeToTasksByDate(normalizedDate)
        .listen((items) {
          _tasksByDate[normalizedDate] = items;
          notifyListeners();
        });
    return true; // subscription started
  }

  /// Stops watching tasks for a specific date
  ///
  /// Use this when:
  /// - Navigating away from a date view
  /// - Limiting active subscriptions to save resources
  /// - Implementing a "keep only N dates subscribed" strategy
  void stopWatchingTasksByDate(DateTime date) {
    final normalizedDate = DiaDateUtils.normalizeToDay(date);
    _tasksSubscriptionsByDate[normalizedDate]?.cancel();
    _tasksSubscriptionsByDate.remove(normalizedDate);
    _tasksByDate.remove(normalizedDate);
    notifyListeners();
  }

  @override
  void dispose() {
    // Cancel all subscriptions when the VM is disposed
    // This prevents memory leaks and stops Firestore listeners
    for (final subscription in _tasksSubscriptionsByDate.values) {
      subscription.cancel();
    }
    _tasksSubscriptionsByDate.clear();
    _tasksByDate.clear();
    super.dispose();
  }
}
