import 'package:ddd_todo_sample/application/dto/task_dto.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/page/task_edit_page.dart';
import 'package:ddd_todo_sample/presentation/widget/date_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListTile extends StatelessWidget {
  final TaskDto task;

  TaskListTile({@required this.task});

  @override
  Widget build(BuildContext context) {
    final TaskNotifier notifier = Provider.of<TaskNotifier>(context);
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.check_circle_outline),
        onPressed: () {
          notifier.updateTask(id: task.id, title: task.title, description: task.description, date: task.date, status: true);
        },
      ),
      title: Text(task.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(task.description),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 4.0),
              DateText(dateTime: task.date),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TaskEditPage(task: task);
            },
          ),
        );
      },
    );
  }
}
