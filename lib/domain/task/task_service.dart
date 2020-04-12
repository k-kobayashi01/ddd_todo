import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:ddd_todo_sample/infrastructure/db_helper.dart';
import 'package:ddd_todo_sample/infrastructure/task/task_repository.dart';

class TaskService {
  // TODO: Service Locator
  TaskRepositoryBase _repository = TaskRepository(dbHelper: DbHelper());

  Future<bool> isExist(TaskTitle title) async {
    final Task task = await _repository.findByTitle(title);
    return task != null;
  }
}
