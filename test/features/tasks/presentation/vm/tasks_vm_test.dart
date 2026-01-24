import 'dart:async';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/presentation/vm/tasks_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dia_app/core/utils/dia_date_utils.dart';

import '../../../../core/mocks/fake_data.dart';
import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  late MockTaskRepoInterface mockTaskRepo;
  late TasksVM sut;

  setUp(() {
    mockTaskRepo = MockTaskRepoInterface();
    sut = TasksVM(taskRepo: mockTaskRepo);
  });

  tearDown(() {
    sut.dispose();
  });

  test('WHEN loadedDailyTasks is called THEN should return empty map', () {
    // Default state
    expect(sut.tasksByDate, isEmpty);
  });

  test(
    'WHEN subscribeToTasksByDate() is called THEN should update tasksByDate through stream emissions',
    () async {
      // Arrange
      final streamController = StreamController<List<Item>>();

      when(
        mockTaskRepo.subscribeToTasksByDate(FakeData.date),
      ).thenAnswer((_) => streamController.stream);

      // Act: Start watching
      sut.subscribeToTasksByDate(FakeData.date);

      // Emit a value
      streamController.add(FakeData.items);

      // Wait for async state update
      await Future.delayed(Duration.zero);

      // Verify state changed to succeeded
      expect(
        sut.tasksByDate[DiaDateUtils.normalizeToDay(FakeData.date)],
        FakeData.items,
      );

      // Cleanup
      await streamController.close();
    },
  );
}
