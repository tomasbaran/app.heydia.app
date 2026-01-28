import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/item.dart';

/// Firestore <-> Domain mapper for [Item].
///
/// Firestore document schema:
/// - type: 'task' | 'todo' | 'event'
final class ItemFirestoreMapper {
  const ItemFirestoreMapper._();

  // Field keys (single source of truth)
  static const _kType = 'type';
  static const _kTaskType = 'task';
  static const _kTodoType = 'todo';
  static const _kEventType = 'event';

  static const _kTitle = 'title';
  static const _kIsCompleted = 'isCompleted';
  static const _kDate = 'date';
  static const _kStartDateTime = 'startDateTime';
  static const _kEndDateTime = 'endDateTime';
  static const _kCreatedAt = 'createdAt';
  static const _kUpdatedAt = 'updatedAt';

  static Item fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data() ?? const <String, dynamic>{};

    final type = data[_kType] as String?;
    final title = data[_kTitle] as String? ?? '';
    final isCompleted = data[_kIsCompleted] as bool? ?? false;

    DateTime? toDate(Object? v) => v is Timestamp ? v.toDate() : null;

    final createdAt = toDate(data[_kCreatedAt]);
    final updatedAt = toDate(data[_kUpdatedAt]);

    switch (type) {
      case _kTodoType:
        return Item.todo(
          id: snapshot.id,
          title: title,
          date:
              toDate(data[_kDate]) ??
              (throw FormatException(
                'Missing "$_kDate" for todo ${snapshot.reference.path}',
              )),
          isCompleted: isCompleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

      case _kEventType:
        return Item.event(
          id: snapshot.id,
          title: title,
          startDateTime:
              toDate(data[_kStartDateTime]) ??
              (throw FormatException(
                'Missing "$_kStartDateTime" for event ${snapshot.reference.path}',
              )),
          endDateTime: toDate(data[_kEndDateTime]),
          isCompleted: isCompleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

      case _kTaskType:
      default:
        return Item.task(
          id: snapshot.id,
          title: title,
          isCompleted: isCompleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    }
  }

  static Map<String, dynamic> toFirestore(Item item) {
    return item.map(
      task: (task) => {
        _kType: _kTaskType,
        _kTitle: task.title,
        _kIsCompleted: task.isCompleted,
        if (task.createdAt != null)
          _kCreatedAt: Timestamp.fromDate(task.createdAt!),
        if (task.updatedAt != null)
          _kUpdatedAt: Timestamp.fromDate(task.updatedAt!),
      },
      todo: (todo) => {
        _kType: _kTodoType,
        _kTitle: todo.title,
        _kIsCompleted: todo.isCompleted,
        _kDate: Timestamp.fromDate(todo.date),
        if (todo.createdAt != null)
          _kCreatedAt: Timestamp.fromDate(todo.createdAt!),
        if (todo.updatedAt != null)
          _kUpdatedAt: Timestamp.fromDate(todo.updatedAt!),
      },
      event: (event) => {
        _kType: _kEventType,
        _kTitle: event.title,
        _kIsCompleted: event.isCompleted,
        _kStartDateTime: Timestamp.fromDate(event.startDateTime),
        if (event.endDateTime != null)
          _kEndDateTime: Timestamp.fromDate(event.endDateTime!),
        if (event.createdAt != null)
          _kCreatedAt: Timestamp.fromDate(event.createdAt!),
        if (event.updatedAt != null)
          _kUpdatedAt: Timestamp.fromDate(event.updatedAt!),
      },
    );
  }
}
