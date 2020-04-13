import 'package:ddd_todo_sample/common/exception.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_create_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/widget/date_picker.dart';
import 'package:ddd_todo_sample/presentation/widget/date_text.dart';
import 'package:ddd_todo_sample/presentation/widget/icon_text_field.dart';
import 'package:ddd_todo_sample/presentation/widget/simple_snack_bar.dart';
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
  void initState() {
    super.initState();
    Provider.of<TaskCreateNotifier>(context, listen: false).init();
  }

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
              final DateTime selectedDate = await DatePicker().show(context);
              notifier.setDate(selectedDate);
            },
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            label: const Text('Created'),
            icon: Icon(Icons.check),
            onPressed: () async {
              final taskNotifier = Provider.of<TaskNotifier>(context, listen: false);
              try {
                await taskNotifier.saveTask(
                  title: notifier.title,
                  description: notifier.description,
                  date: notifier.date,
                );
                Navigator.pop(context);
              } on NullEmptyException catch (e) {
                switch (e.code) {
                  case ExceptionCode.taskTitle:
                    SimpleSnackBar().show(context, message: 'タイトルを入力してください');
                    break;
                  case ExceptionCode.taskDate:
                    SimpleSnackBar().show(context, message: '日付を入力してください');
                    break;
                  default:
                    SimpleSnackBar().show(context, message: 'エラーが発生しました');
                    break;
                }
              } on LengthException catch (e) {
                switch (e.code) {
                  case ExceptionCode.taskTitle:
                    SimpleSnackBar().show(context, message: 'タイトルを短くしてください');
                    break;
                  case ExceptionCode.taskDescription:
                    SimpleSnackBar().show(context, message: '詳細を短くしてください');
                    break;
                  default:
                    SimpleSnackBar().show(context, message: 'エラーが発生しました');
                    break;
                }
              }
            },
          );
        },
      ),
    );
  }
}
