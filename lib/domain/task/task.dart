import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:flutter/material.dart';

class Task {
  final TaskId _id;
  final TaskTitle _title;
  final TaskDescription _description;
  final TaskDate _date;

  Task({
    @required TaskId id,
    @required TaskTitle title,
    @required TaskDescription description,
    @required TaskDate date,
  })  : _id = id,
        _title = title,
        _description = description,
        _date = date;

  TaskId get id => _id;
  TaskTitle get title => _title;
  TaskDescription get description => _description;
  TaskDate get date => _date;
}
