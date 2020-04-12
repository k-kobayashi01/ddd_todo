import 'package:ddd_todo_sample/application/command/task_create_command.dart';
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
    _applicationService.create(command);
  }

  Future<List<TaskDto>> getTasks() async {
    return await _applicationService.getTasks();
  }

  Future<void> _updateTasks() async {
    _tasks = await _applicationService.getTasks();

    notifyListeners();
  }
}
