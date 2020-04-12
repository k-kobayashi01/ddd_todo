import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/page/task_created_page.dart';
import 'package:ddd_todo_sample/presentation/widget/task_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatelessWidget {
  static const String routeName = 'TaskListPage';

  @override
  Widget build(BuildContext context) {
    final TaskNotifier notifier = Provider.of<TaskNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('TODO')),
      body: Builder(
        builder: (_) {
          if (notifier.tasks == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: notifier.tasks.length,
            itemBuilder: (_, index) {
              return TaskListTile(task: notifier.tasks[index]);
            },
            separatorBuilder: (_, __) {
              return Divider(height: 2.0);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, TaskCreatedPage.routeName);
        },
      ),
    );
  }
}
