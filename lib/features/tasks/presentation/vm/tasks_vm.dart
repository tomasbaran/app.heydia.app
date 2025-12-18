import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/core/utils/date_utils.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/domain/repo_interfaces/task_repo_interface.dart';
import 'package:flutter/foundation.dart';

class TasksVM extends ChangeNotifier {
  TasksVM({required this.taskRepo});
  final TaskRepoInterface taskRepo;

  final Map<DateTime, List<Item>> _dailyTasksMap = {};
  final Map<DateTime, StreamCommand<List<Item>, DateTime>> _subscriptionsMap =
      {};

  Map<DateTime, List<Item>> get dailyTasks => _dailyTasksMap;

  StreamCommand<List<Item>, DateTime> _watchTasksByDateCommand(DateTime date) =>
      StreamCommand(watch: (date) => taskRepo.watchTasksByDate(date));

  StreamCommand<List<Item>, DateTime> watchTasksByDateCommand(DateTime date) =>
      _watchTasksByDateCommand(date);

  /// Subscribes to tasks for a specific date
  ///
  /// The stream will automatically update [dailyTasks] whenever tasks
  /// are added, updated, or deleted in Firestore.
  void watchTasksByDate(DateTime date) {
    final normalizedDate = DateUtils.normalizeToDay(date);

    // Cancel existing subscription for this date if any
    _subscriptionsMap[normalizedDate]?.cancel();

    _subscriptionsMap[normalizedDate] = _watchTasksByDateCommand(
      normalizedDate,
    );
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
