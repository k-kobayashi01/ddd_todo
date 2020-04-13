import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_status.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:flutter/material.dart';

class Task {
  final TaskId _id;
  TaskTitle _title;
  TaskDescription _description;
  TaskDate _date;
  TaskStatus _status;

  Task({
    TaskId id,
    @required TaskTitle title,
    @required TaskDescription description,
    @required TaskDate date,
    @required TaskStatus status,
  })  : _id = id,
        _title = title,
        _description = description,
        _date = date,
        _status = status;

  TaskId get id => _id;
  TaskTitle get title => _title;
  TaskDescription get description => _description;
  TaskDate get date => _date;
  TaskStatus get status => _status;

  void changeTitle(TaskTitle newTitle) {
    _title = newTitle;
  }

  void changeDescription(TaskDescription newDescription) {
    _description = newDescription;
  }

  void changeDate(TaskDate newDate) {
    _date = newDate;
  }

  void changeStatus(TaskStatus newStatus) {
    _status = newStatus;
  }
}
