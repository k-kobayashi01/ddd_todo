import 'package:ddd_todo_sample/common/exception.dart';

class TaskId {
  final int _id;

  TaskId(this._id) {
    if (_id == null) throw NullEmptyException(code: ExceptionCode.taskId);
  }

  int get id => _id;
}
