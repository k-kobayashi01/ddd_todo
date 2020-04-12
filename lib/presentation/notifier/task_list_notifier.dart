import 'package:ddd_todo_sample/application/command/task_create_command.dart';
import 'package:ddd_todo_sample/application/dto/task_dto.dart';
import 'package:ddd_todo_sample/application/task_application_service.dart';
import 'package:flutter/material.dart';

class TaskNotifier with ChangeNotifier {
  final TaskApplicationService _applicationService = TaskApplicationService();

  DateTime _date;

  List<TaskDto> _list;

  DateTime get date => _date;

  void setDate(DateTime newDate) {
    _date = newDate;

    notifyListeners();
  }

  void saveTask({
    @required String title,
    @required String description,
    @required DateTime date,
  }) {
    final TaskCreateCommand command = TaskCreateCommand(
      title: title,
      description: description,
      date: date,
    );
    _applicationService.create(command);
  }
}
