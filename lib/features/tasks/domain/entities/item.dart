import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

/// Sealed class representing different types of planner items
///
/// - [Item.task]: Base item with no date/time
/// - [Item.todo]: Item with date (but no specific time)
/// - [Item.event]: Item with both date and time
@freezed
sealed class Item with _$Item {
  const Item._();

  /// Base task: no date, no time
  const factory Item.task({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = Task;

  /// Todo: has a date (but no specific time)
  const factory Item.todo({
    required String id,
    required String title,
    required DateTime date,
    @Default(false) bool isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = Todo;

  /// Event: has both date and time
  const factory Item.event({
    required String id,
    required String title,
    required DateTime startDateTime,
    DateTime? endDateTime,
    @Default(false) bool isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = Event;
}
