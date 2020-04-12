import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';

class TaskService {
  TaskRepositoryBase _repository;

  bool isExist(TaskTitle title) {
    final Task task = _repository.find(title);
    return task.id != null;
  }
}
