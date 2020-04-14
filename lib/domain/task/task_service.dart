import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:get_it/get_it.dart';

class TaskService {
  TaskRepositoryBase _repository = GetIt.instance<TaskRepositoryBase>();

  Future<bool> isExist(TaskTitle title) async {
    final Task task = await _repository.findByTitle(title);
    return task != null;
  }
}
