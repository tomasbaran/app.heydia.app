import 'dart:async';

import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/tasks/domain/entities/item.dart';
import 'package:dia_app/features/tasks/presentation/vm/tasks_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

  test(
    'WHEN tasksCommandByDate is called THEN should return default state',
    () {
      // Default state
      expect(sut.loadedDailyTasks, isEmpty);

      expect(
        sut.tasksCommandByDate,
        isA<StreamCommand<List<Item>, DateTime>>(),
      );
      expect(
        sut.tasksCommandByDate.state.value,
        CommandState<List<Item>>.idle(),
      );
    },
  );

  test(
    'WHEN watchTasksByDate() is called THEN should update state through stream emissions',
    () async {
      // Arrange
      final streamController = StreamController<Result<List<Item>>>();

      when(
        mockTaskRepo.watchTasksByDate(FakeData.date),
      ).thenAnswer((_) => streamController.stream);

      // Act: Start watching
      sut.watchTasksByDate(FakeData.date);

      // Assert initial state

      expect(
        sut.tasksCommandByDate.state.value,
        CommandState<List<Item>>.executing(),
      );
      expect(sut.tasksCommandByDate.isActive, isTrue);

      // Emit a value
      streamController.add(Result.ok(FakeData.items));

      // Wait for async state update
      await Future.delayed(Duration.zero);

      // Verify state changed to succeeded
      expect(
        sut.tasksCommandByDate.state.value,
        CommandState<List<Item>>.succeeded(FakeData.items),
      );

      // Cleanup
      await streamController.close();
    },
  );
}
