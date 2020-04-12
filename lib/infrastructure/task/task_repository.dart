import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:ddd_todo_sample/infrastructure/db_helper.dart';
import 'package:flutter/material.dart';

class TaskRepository implements TaskRepositoryBase {
  final DbHelper _dbHelper;

  TaskRepository({@required DbHelper dbHelper}) : _dbHelper = dbHelper;

  @override
  Future<List<Task>> find() async {
    final List<Map<String, dynamic>> list = await _dbHelper.rawQuery('SELECT * FROM tasks');
    return list.map((data) => toTask(data)).toList();
  }

  @override
  Future<Task> findByTitle(TaskTitle title) async {
    final List<Map<String, dynamic>> list = await _dbHelper.rawQuery('SELECT * FROM tasks WHERE title = ?', [title.value]);
    return list.isEmpty ? null : toTask(list[0]);
  }

  @override
  void remove(Task task) {
    // TODO: implement remove
  }

  @override
  void save(Task task) {
    _dbHelper.rawInsert(
      'INSERT INTO tasks (title, description, date) VALUES (?, ?, ?)',
      [task.title.value, task.description.value, task.date.value.toString()],
    );
  }

  Task toTask(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'].toString();
    final String description = data['description'].toString();
    final String date = data['date'];

    return Task(
      id: TaskId(id),
      title: TaskTitle(title),
      description: TaskDescription(description),
      date: TaskDate.fromString(date),
    );
  }
}
