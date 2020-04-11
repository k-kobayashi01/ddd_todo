import 'package:ddd_todo_sample/presentation/widget/icon_text_field.dart';
import 'package:flutter/material.dart';

class TaskCreatedPage extends StatelessWidget {
  static const String routeName = 'TaskCreatedPage';

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Created'),
        icon: Icon(Icons.check),
        onPressed: () => Navigator.pop(context),
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
