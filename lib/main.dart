import 'package:ddd_todo_sample/presentation/notifier/task_create_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_edit_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/page/task_created_page.dart';
import 'package:ddd_todo_sample/presentation/page/task_edit_page.dart';
import 'package:ddd_todo_sample/presentation/page/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskNotifier>(
          create: (_) => TaskNotifier(),
        ),
        ChangeNotifierProvider<TaskCreateNotifier>(
          create: (_) => TaskCreateNotifier(),
        ),
        ChangeNotifierProvider<TaskEditNotifier>(
          create: (_) => TaskEditNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskListPage(),
        routes: {
          TaskEditPage.routeName: (_) => TaskEditPage(),
          TaskCreatedPage.routeName: (_) => TaskCreatedPage(),
        },
      ),
    );
  }
}
