import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/features/tasks/data/mappers/item_firestore_mapper.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mocks/fake_data.dart';
import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  late MockDocumentSnapshot mockSnapshot;
  late MockDocumentReference mockRef;

  void stubSnapshot({
    required String id,
    required Map<String, dynamic> data,
    String refPath = 'items/doc-1',
  }) {
    when(mockSnapshot.id).thenReturn(id);
    when(mockSnapshot.data()).thenReturn(data);
    when(mockSnapshot.reference).thenReturn(mockRef);
    when(mockRef.path).thenReturn(refPath);
  }

  setUp(() {
    mockSnapshot = MockDocumentSnapshot();
    mockRef = MockDocumentReference();
  });

  group('ItemFirestoreMapper.fromFirestore', () {

    test('WHEN type is "task" THEN returns Item.task', () {
      stubSnapshot(
        id: 'task-1',
        data: {
          'type': 'task',
          'title': 'My Task',
          'isCompleted': true,
        },
      );

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(item, isA<Task>());
      final task = item as Task;
      expect(task.id, 'task-1');
      expect(task.title, 'My Task');
      expect(task.isCompleted, true);
      expect(task.createdAt, isNull);
      expect(task.updatedAt, isNull);
    });

    test('WHEN type is "task" with Timestamps THEN maps createdAt and updatedAt',
        () {
      final createdAt = Timestamp.fromDate(DateTime(2026, 1, 1, 10, 0));
      final updatedAt = Timestamp.fromDate(DateTime(2026, 1, 2, 11, 0));
      stubSnapshot(
        id: 't1',
        data: {
          'type': 'task',
          'title': 'T',
          'isCompleted': false,
          'createdAt': createdAt,
          'updatedAt': updatedAt,
        },
      );

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null)
          as Task;

      expect(item.createdAt, DateTime(2026, 1, 1, 10, 0));
      expect(item.updatedAt, DateTime(2026, 1, 2, 11, 0));
    });

    test('WHEN type is missing or unknown THEN defaults to Item.task', () {
      stubSnapshot(id: 'x', data: {'title': 'X'});

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(item, isA<Task>());
      expect((item as Task).id, 'x');
      expect(item.title, 'X');
      expect(item.isCompleted, false);
    });

    test('WHEN data() is null THEN treats as empty and returns task', () {
      when(mockSnapshot.id).thenReturn('id');
      when(mockSnapshot.data()).thenReturn(null);

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(item, isA<Task>());
      expect((item as Task).id, 'id');
      expect(item.title, '');
      expect(item.isCompleted, false);
    });

    test('WHEN type is "todo" with date THEN returns Item.todo', () {
      final dateTs = Timestamp.fromDate(FakeData.date);
      stubSnapshot(
        id: 'todo-1',
        data: {
          'type': 'todo',
          'title': 'My Todo',
          'isCompleted': false,
          'date': dateTs,
        },
      );

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(item, isA<Todo>());
      final todo = item as Todo;
      expect(todo.id, 'todo-1');
      expect(todo.title, 'My Todo');
      expect(todo.date, FakeData.date);
      expect(todo.isCompleted, false);
    });

    test('WHEN type is "todo" and date is missing THEN throws FormatException',
        () {
      stubSnapshot(
        id: 'todo-1',
        data: {'type': 'todo', 'title': 'T'},
        refPath: 'items/todo-1',
      );

      expect(
        () => ItemFirestoreMapper.fromFirestore(mockSnapshot, null),
        throwsFormatException,
      );
    });

    test('WHEN type is "event" with startDateTime THEN returns Item.event', () {
      final startTs = Timestamp.fromDate(DateTime(2026, 1, 15, 9, 0));
      final endTs = Timestamp.fromDate(DateTime(2026, 1, 15, 10, 0));
      stubSnapshot(
        id: 'ev-1',
        data: {
          'type': 'event',
          'title': 'Meeting',
          'isCompleted': false,
          'startDateTime': startTs,
          'endDateTime': endTs,
        },
      );

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(item, isA<Event>());
      final ev = item as Event;
      expect(ev.id, 'ev-1');
      expect(ev.title, 'Meeting');
      expect(ev.startDateTime, DateTime(2026, 1, 15, 9, 0));
      expect(ev.endDateTime, DateTime(2026, 1, 15, 10, 0));
      expect(ev.isCompleted, false);
    });

    test('WHEN type is "event" and endDateTime is missing THEN endDateTime is null',
        () {
      final startTs = Timestamp.fromDate(DateTime(2026, 1, 15, 9, 0));
      stubSnapshot(
        id: 'ev-1',
        data: {
          'type': 'event',
          'title': 'M',
          'startDateTime': startTs,
        },
      );

      final item = ItemFirestoreMapper.fromFirestore(mockSnapshot, null)
          as Event;

      expect(item.endDateTime, isNull);
    });

    test('WHEN type is "event" and startDateTime is missing THEN throws FormatException',
        () {
      stubSnapshot(
        id: 'ev-1',
        data: {'type': 'event', 'title': 'E'},
        refPath: 'items/ev-1',
      );

      expect(
        () => ItemFirestoreMapper.fromFirestore(mockSnapshot, null),
        throwsFormatException,
      );
    });
  });

  group('ItemFirestoreMapper.toFirestore', () {
    test('WHEN Item.task THEN returns map with type, title, isCompleted', () {
      final item = FakeData.task(id: 't1', title: 'Task', isCompleted: true);

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['type'], 'task');
      expect(map['title'], 'Task');
      expect(map['isCompleted'], true);
      expect(map.containsKey('createdAt'), false);
      expect(map.containsKey('updatedAt'), false);
    });

    test('WHEN Item.task with createdAt and updatedAt THEN includes Timestamps',
        () {
      final created = DateTime(2026, 1, 1, 8, 0);
      final updated = DateTime(2026, 1, 2, 9, 0);
      final item = Item.task(
        id: 't1',
        title: 'T',
        isCompleted: false,
        createdAt: created,
        updatedAt: updated,
      );

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['createdAt'], Timestamp.fromDate(created));
      expect(map['updatedAt'], Timestamp.fromDate(updated));
    });

    test('WHEN Item.todo THEN returns map with type, title, isCompleted, date',
        () {
      final item = FakeData.todo(id: 'todo-1', title: 'Todo', date: FakeData.date);

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['type'], 'todo');
      expect(map['title'], 'Todo');
      expect(map['isCompleted'], false);
      expect(map['date'], Timestamp.fromDate(FakeData.date));
    });

    test('WHEN Item.todo with createdAt and updatedAt THEN includes Timestamps',
        () {
      final created = DateTime(2026, 1, 1);
      final updated = DateTime(2026, 1, 2);
      final item = Item.todo(
        id: 'todo-1',
        title: 'T',
        date: FakeData.date,
        createdAt: created,
        updatedAt: updated,
      );

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['createdAt'], Timestamp.fromDate(created));
      expect(map['updatedAt'], Timestamp.fromDate(updated));
    });

    test('WHEN Item.event THEN returns map with type, title, startDateTime',
        () {
      final start = DateTime(2026, 1, 15, 10, 0);
      final item = Item.event(
        id: 'ev-1',
        title: 'Event',
        startDateTime: start,
        endDateTime: null,
      );

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['type'], 'event');
      expect(map['title'], 'Event');
      expect(map['startDateTime'], Timestamp.fromDate(start));
      expect(map.containsKey('endDateTime'), false);
    });

    test('WHEN Item.event with endDateTime THEN includes endDateTime', () {
      final start = DateTime(2026, 1, 15, 10, 0);
      final end = DateTime(2026, 1, 15, 11, 0);
      final item = FakeData.event(
        id: 'ev-1',
        title: 'E',
        startDateTime: start,
        endDateTime: end,
      );

      final map = ItemFirestoreMapper.toFirestore(item);

      expect(map['endDateTime'], Timestamp.fromDate(end));
    });
  });

  group('round-trip', () {
    test('Item.task toFirestore then fromFirestore preserves data', () {
      final item = Item.task(
        id: 'rt-task',
        title: 'Round-trip Task',
        isCompleted: true,
        createdAt: DateTime(2026, 1, 1, 12, 0),
        updatedAt: DateTime(2026, 1, 2, 12, 0),
      );
      final map = ItemFirestoreMapper.toFirestore(item);

      stubSnapshot(
        id: item.id,
        data: Map<String, dynamic>.from(map),
      );
      // toFirestore uses Timestamp; fromFirestore expects Timestamp in the map.
      // The map already has Timestamp values for createdAt/updatedAt.
      // But fromFirestore's toDate only handles Timestamp - so we're good.

      final back = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(back, isA<Task>());
      final t = back as Task;
      expect(t.id, item.id);
      expect(t.title, item.title);
      expect(t.isCompleted, item.isCompleted);
      expect(t.createdAt, item.createdAt);
      expect(t.updatedAt, item.updatedAt);
    });

    test('Item.todo toFirestore then fromFirestore preserves data', () {
      final date = FakeData.date;
      final item = FakeData.todo(
        id: 'rt-todo',
        title: 'Round-trip Todo',
        date: date,
        isCompleted: true,
      );
      final map = ItemFirestoreMapper.toFirestore(item);

      stubSnapshot(id: item.id, data: Map<String, dynamic>.from(map));

      final back = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(back, isA<Todo>());
      final t = back as Todo;
      expect(t.id, item.id);
      expect(t.title, item.title);
      expect(t.date, date);
      expect(t.isCompleted, item.isCompleted);
    });

    test('Item.event toFirestore then fromFirestore preserves data', () {
      final start = DateTime(2026, 1, 20, 14, 0);
      final end = DateTime(2026, 1, 20, 15, 0);
      final item = FakeData.event(
        id: 'rt-ev',
        title: 'Round-trip Event',
        startDateTime: start,
        endDateTime: end,
      );
      final map = ItemFirestoreMapper.toFirestore(item);

      stubSnapshot(id: item.id, data: Map<String, dynamic>.from(map));

      final back = ItemFirestoreMapper.fromFirestore(mockSnapshot, null);

      expect(back, isA<Event>());
      final e = back as Event;
      expect(e.id, item.id);
      expect(e.title, item.title);
      expect(e.startDateTime, start);
      expect(e.endDateTime, end);
      expect(e.isCompleted, item.isCompleted);
    });
  });
}
