import 'package:ddd_todo_sample/application/command/task_create_command.dart';
import 'package:ddd_todo_sample/common/exception.dart';
import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_factory_base.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/task_service.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_title.dart';
import 'package:ddd_todo_sample/infrastructure/db_helper.dart';
import 'package:ddd_todo_sample/infrastructure/task/task_factory.dart';
import 'package:ddd_todo_sample/infrastructure/task/task_repository.dart';

class TaskApplicationService {
  // TODO Service Locator
  final TaskRepositoryBase _taskRepository = TaskRepository(dbHelper: DbHelper());
  final TaskFactoryBase _taskFactory = TaskFactory();
  final TaskService _service = TaskService();

  Future<void> create(TaskCreateCommand command) async {
    final TaskTitle title = TaskTitle(command.title);
    final TaskDescription description = TaskDescription(command.description);
    final TaskDate date = TaskDate(command.date);

    final Task task = _taskFactory.create(title: title, description: description, date: date);

    if (await _service.isExist(title)) {
      throw NotUniqueException(code: ExceptionCode.taskTitle);
    }

    _taskRepository.save(task);
  }
}
