import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/infrastructure/db_helper.dart';
import 'package:ddd_todo_sample/infrastructure/task/task_repository.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_create_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_edit_notifier.dart';
import 'package:ddd_todo_sample/presentation/notifier/task_notifier.dart';
import 'package:ddd_todo_sample/presentation/page/task_created_page.dart';
import 'package:ddd_todo_sample/presentation/page/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
        Provider<DbHelper>(
          lazy: false,
          create: (_) {
            final DbHelper helper = DbHelper();

            final GetIt getIt = GetIt.instance;
            getIt.registerSingleton<TaskRepositoryBase>(TaskRepository(dbHelper: helper));

            return helper;
          },
          dispose: (_, helper) async => await helper.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskListPage(),
        routes: {
          TaskCreatedPage.routeName: (_) => TaskCreatedPage(),
        },
      ),
    );
  }
}
