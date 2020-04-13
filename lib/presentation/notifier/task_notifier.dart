import 'package:ddd_todo_sample/application/command/task_create_command.dart';
import 'package:ddd_todo_sample/application/command/task_delete_command.dart';
import 'package:ddd_todo_sample/application/command/task_update_command.dart';
import 'package:ddd_todo_sample/application/dto/task_dto.dart';
import 'package:ddd_todo_sample/application/task_application_service.dart';
import 'package:flutter/material.dart';

class TaskNotifier with ChangeNotifier {
  TaskNotifier() {
    _updateTasks();
  }

  final TaskApplicationService _applicationService = TaskApplicationService();

  List<TaskDto> _tasks;

  List<TaskDto> get tasks => _tasks == null ? null : List.unmodifiable(_tasks);

  Future<void> saveTask({
    @required String title,
    @required String description,
    @required DateTime date,
  }) async {
    final TaskCreateCommand command = TaskCreateCommand(
      title: title,
      description: description,
      date: date,
    );
    await _applicationService.create(command);
    _updateTasks();
  }

  Future<void> updateTask({
    @required int id,
    @required String title,
    @required String description,
    @required DateTime date,
  }) async {
    final TaskUpdateCommand command = TaskUpdateCommand(
      id: id,
      title: title,
      description: description,
      date: date,
    );
    await _applicationService.update(command);
    _updateTasks();
  }

  Future<void> deleteTask({@required int id}) async {
    final TaskDeleteCommand command = TaskDeleteCommand(id: id);
    await _applicationService.delete(command);
    _updateTasks();
  }

  Future<List<TaskDto>> getTasks() async {
    return await _applicationService.getTasks();
  }

  Future<void> _updateTasks() async {
    _tasks = await _applicationService.getTasks();

    notifyListeners();
  }
}
