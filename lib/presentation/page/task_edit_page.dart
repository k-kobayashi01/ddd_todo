import 'package:ddd_todo_sample/presentation/widget/icon_text_field.dart';
import 'package:flutter/material.dart';

class TaskEditPage extends StatefulWidget {
  static const String routeName = 'TaskEditPage';

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(height: 16.0),
          IconTextField(
            controller: descriptionController,
            iconData: Icons.subject,
            hint: 'Description',
          ),
          const SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: const Text('4/16'),
            onTap: () async {
              final DateTime selectedDate = await _showDatePicker(context);
            },
          ),
        ],
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
