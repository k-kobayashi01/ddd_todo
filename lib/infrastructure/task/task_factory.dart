import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_factory_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:flutter/material.dart';

class TaskFactory implements TaskFactoryBase {
  @override
  Task create({
    @required TaskTitle title,
    TaskDescription description,
    @required TaskDate date,
  }) {
    // TODO ID採番
    return Task(
      id: TaskId(1),
      title: title,
      description: description,
      date: date,
    );
  }
}
