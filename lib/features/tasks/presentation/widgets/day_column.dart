import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/features/tasks/presentation/vm/tasks_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayColumn extends StatefulWidget {
  const DayColumn({super.key, required this.date});
  final DateTime date;

  @override
  State<DayColumn> createState() => _DayColumnState();
}

class _DayColumnState extends State<DayColumn> {
  @override
  void initState() {
    super.initState();
    context.read<TasksVM>().watchTasksByDate(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return const DayColumnView();
  }
}

class DayColumnView extends StatelessWidget {
  const DayColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksVM = context.read<TasksVM>();

    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: tasksVM.tasksCommandByDate.state,
        builder: (context, taskCommandState, child) {
          return taskCommandState.when(
            idle: () => const SizedBox.shrink(),
            executing: () => const Center(child: CircularProgressIndicator()),
            succeeded: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Text(data[index].title),
            ),
            failed: (error) => Center(child: Text(error)),
          );
        },
      ),
    );
  }
}
