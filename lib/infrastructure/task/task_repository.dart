import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_status.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:ddd_todo_sample/infrastructure/db_helper.dart';
import 'package:flutter/material.dart';

class TaskRepository implements TaskRepositoryBase {
  final DbHelper _dbHelper;

  TaskRepository({@required DbHelper dbHelper}) : _dbHelper = dbHelper;

  @override
  Future<T> transaction<T>(Future<T> Function() f) async {
    return await _dbHelper.transaction<T>(() async => await f());
  }

  @override
  Future<List<Task>> find() async {
    final List<Map<String, dynamic>> list = await _dbHelper.rawQuery('SELECT * FROM tasks WHERE status = 0 ORDER BY date');
    return list.map((data) => toTask(data)).toList();
  }

  @override
  Future<Task> findById(TaskId id) async {
    final List<Map<String, dynamic>> list = await _dbHelper.rawQuery('SELECT * FROM tasks WHERE id = ? AND status = 0', [id.value]);
    return list.isEmpty ? null : toTask(list[0]);
  }

  @override
  Future<Task> findByTitle(TaskTitle title) async {
    final List<Map<String, dynamic>> list = await _dbHelper.rawQuery('SELECT * FROM tasks WHERE title = ? AND status = 0', [title.value]);
    return list.isEmpty ? null : toTask(list[0]);
  }

  @override
  void delete(TaskId id) {
    _dbHelper.rawDelete('DELETE FROM tasks WHERE id = ?', [id.value]);
  }

  @override
  void save(Task task) {
    _dbHelper.rawInsert(
      'INSERT OR REPLACE INTO tasks (id, title, description, date, status) VALUES (?, ?, ?, ?, ?)',
      [task.id?.value ?? null, task.title.value, task.description.value, task.date.value.toString(), task.status.isDone],
    );
  }

  Task toTask(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'].toString();
    final String description = data['description'].toString();
    final String date = data['date'];
    final bool status = data['status'] == 1;

    return Task(
      id: TaskId(id),
      title: TaskTitle(title),
      description: TaskDescription(description),
      date: TaskDate.fromString(date),
      status: TaskStatus(status),
    );
  }
}
