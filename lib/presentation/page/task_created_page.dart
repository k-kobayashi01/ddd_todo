import 'package:ddd_todo_sample/presentation/notifier/task_create_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/widget/date_text.dart';
import 'package:ddd_todo_sample/presentation/widget/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskCreatedPage extends StatefulWidget {
  static const String routeName = 'TaskCreatedPage';

  @override
  _TaskCreatedPageState createState() => _TaskCreatedPageState();
}

class _TaskCreatedPageState extends State<TaskCreatedPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<TaskCreateNotifier>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          IconTextField(
            controller: titleController,
            iconData: Icons.title,
            hint: 'Title',
            onChanged: (title) {
              notifier.setTitle(title);
            },
          ),
          const SizedBox(height: 16.0),
          IconTextField(
            controller: descriptionController,
            iconData: Icons.subject,
            hint: 'Description',
            onChanged: (description) {
              notifier.setDescription(description);
            },
          ),
          const SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: DateText(dateTime: notifier.date),
            onTap: () async {
              final DateTime selectedDate = await _showDatePicker(context);
              notifier.setDate(selectedDate);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Created'),
        icon: Icon(Icons.check),
        onPressed: () {
          final taskNotifier = Provider.of<TaskNotifier>(context, listen: false);
          taskNotifier.saveTask(
            title: notifier.title,
            description: notifier.description,
            date: notifier.date,
          );
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<DateTime> _showDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2020, 12, 31),
    );
  }
}
