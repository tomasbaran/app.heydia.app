import 'package:dia_app/features/tasks/domain/entities/item.dart';

class FakeData {
  // Common test dates
  static final DateTime date = DateTime(2026, 1, 1);

  // Default test items (use factory methods for customization)
  static Item get item => todo();
  static List<Item> get items => [item];
  static Item get completedItem => todo(isCompleted: true);

  static Item task({String? id, String? title, bool? isCompleted}) {
    return Item.task(
      id: id ?? 'task-1',
      title: title ?? 'Test Task',
      isCompleted: isCompleted ?? false,
    );
  }

  // Factory methods for customizable test data
  static Item todo({
    String? id,
    String? title,
    DateTime? date,
    bool? isCompleted,
  }) {
    return Item.todo(
      id: id ?? '1',
      title: title ?? 'Test',
      date: date ?? FakeData.date,
      isCompleted: isCompleted ?? false,
    );
  }

  static Item event({
    String? id,
    String? title,
    DateTime? startDateTime,
    DateTime? endDateTime,
    bool? isCompleted,
  }) {
    final start = startDateTime ?? date;
    return Item.event(
      id: id ?? 'event-1',
      title: title ?? 'Test Event',
      startDateTime: start,
      endDateTime: endDateTime ?? start.add(const Duration(hours: 1)),
      isCompleted: isCompleted ?? false,
    );
  }
}
