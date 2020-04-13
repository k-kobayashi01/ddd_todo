import 'package:ddd_todo_sample/application/command/task_create_command.dart';
import 'package:ddd_todo_sample/application/command/task_delete_command.dart';
import 'package:ddd_todo_sample/application/command/task_update_command.dart';
import 'package:ddd_todo_sample/application/dto/task_dto.dart';
import 'package:ddd_todo_sample/common/exception.dart';
import 'package:ddd_todo_sample/domain/task/task.dart';
import 'package:ddd_todo_sample/domain/task/task_factory_base.dart';
import 'package:ddd_todo_sample/domain/task/task_repository_base.dart';
import 'package:ddd_todo_sample/domain/task/task_service.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_date.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_description.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_id.dart';
import 'package:ddd_todo_sample/domain/task/value_object/task_status.dart';
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
    final TaskStatus status = TaskStatus(false);

    final Task task = _taskFactory.create(
      title: title,
      description: description,
      date: date,
      status: status,
    );

    if (await _service.isExist(title)) {
      throw NotUniqueException(code: ExceptionCode.taskTitle);
    }

    _taskRepository.save(task);
  }

  Future<List<TaskDto>> getTasks() async {
    final List<Task> tasks = await _taskRepository.find();
    return tasks.map((task) => TaskDto(task)).toList();
  }

  Future<void> update(TaskUpdateCommand command) async {
    final TaskId targetId = TaskId(command.id);

    final Task task = await _taskRepository.findById(targetId);

    if (task == null) {
      throw NotFoundException(code: ExceptionCode.taskId);
    }

    final TaskTitle title = TaskTitle(command.title);
    task.changeTitle(title);

    final TaskDescription description = TaskDescription(command.description);
    task.changeDescription(description);

    final TaskDate date = TaskDate(command.date);
    task.changeDate(date);

    final TaskStatus status = TaskStatus(command.status);
    task.changeStatus(status);

    _taskRepository.save(task);
  }

  Future<void> delete(TaskDeleteCommand command) async {
    final TaskId targetId = TaskId(command.id);

    final Task task = await _taskRepository.findById(targetId);

    if (task == null) {
      throw NotFoundException(code: ExceptionCode.taskId);
    }

    _taskRepository.delete(targetId);
  }
}
