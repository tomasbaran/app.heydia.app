import 'package:flutter/material.dart';

class DayColumn extends StatelessWidget {
  const DayColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return DayColumnView();
  }
}

class DayColumnView extends StatelessWidget {
  const DayColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Text('Item $index'),
    );
  }
}
