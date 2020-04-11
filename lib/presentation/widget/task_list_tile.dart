import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  TaskListTile(this.title, this.description, this.date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.check_circle_outline),
        onPressed: () {},
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(description),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 4.0),
              Text(date),
            ],
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
