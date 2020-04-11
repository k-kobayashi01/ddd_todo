import 'package:ddd_todo_sample/presentation/widget/task_list_tile.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  static const String routeName = 'TaskListPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO')),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            TaskListTile('Title', 'Description', '4/16'),
          ],
        ),
      ),
    );
  }
}
