import 'package:ddd_todo_sample/application/dto/task_dto.dart';
import 'package:ddd_todo_sample/common/exception.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_edit_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/widget/date_picker.dart';
import 'package:ddd_todo_sample/presentation/widget/date_text.dart';
import 'package:ddd_todo_sample/presentation/widget/icon_text_field.dart';
import 'package:ddd_todo_sample/presentation/widget/simple_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskEditPage extends StatefulWidget {
  static const String routeName = 'TaskEditPage';

  final TaskDto task;

  TaskEditPage({@required this.task});

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<TaskEditNotifier>(context, listen: false).init(widget.task);
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<TaskEditNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDialog(context);
            },
          ),
        ],
      ),
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
              final DateTime selectedDate = await DatePicker().show(
                context,
                initialDate: notifier.date,
              );
              notifier.setDate(selectedDate);
            },
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            label: const Text('Update'),
            icon: Icon(Icons.check),
            onPressed: () async {
              final taskNotifier = Provider.of<TaskNotifier>(context, listen: false);
              try {
                taskNotifier.updateTask(
                  id: widget.task.id,
                  title: notifier.title,
                  description: notifier.description,
                  date: notifier.date,
                );
                Navigator.pop(context);
              } on NotFoundException catch (e) {
                switch (e.code) {
                  case ExceptionCode.taskId:
                    SimpleSnackBar().show(context, message: 'すでに存在しないタスクです');
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

  Future _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('削除してよろしいですか？'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
