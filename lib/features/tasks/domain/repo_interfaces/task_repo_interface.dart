import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';

abstract interface class TaskRepoInterface {
  /// Streams tasks for a specific date
  ///
  /// The stream will emit whenever tasks for the given date are added,
  /// updated, or deleted in Firestore.
  Stream<Result<List<Item>>> watchTasksByDate(DateTime date);
}

