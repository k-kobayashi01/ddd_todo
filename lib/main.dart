import 'package:ddd_todo_sample/presentation/page/task_edit_page.dart';
import 'package:ddd_todo_sample/presentation/page/task_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(),
      routes: {
        TaskEditPage.routeName: (_) => TaskEditPage(),
      },
    );
  }
}
