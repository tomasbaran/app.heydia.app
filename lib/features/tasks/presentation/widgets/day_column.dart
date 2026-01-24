import 'package:dia_app/core/utils/dia_date_utils.dart';
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
    context.read<TasksVM>().subscribeToTasksByDate(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return DayColumnView(date: widget.date);
  }
}

class DayColumnView extends StatelessWidget {
  const DayColumnView({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // final tasksVM = context.read<TasksVM>();

    return Expanded(
      child: Consumer<TasksVM>(
        builder: (context, tasksVM, child) {
          final tasks =
              tasksVM.tasksByDate[DiaDateUtils.normalizeToDay(date)] ?? [];
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => Text(tasks[index].title),
          );
        },
      ),
    );
  }
}
