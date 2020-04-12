import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:flutter/material.dart';

abstract class TaskFactoryBase {
  Task create({
    @required TaskTitle title,
    @required TaskDescription description,
    @required TaskDate date,
  });
}
