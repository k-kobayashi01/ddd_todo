import 'package:ddd_todo_sample/common/exception.dart';

class TaskId {
  final int _value;

  TaskId(this._value) {
    if (_value == null) throw NullEmptyException(code: ExceptionCode.taskId);
  }

  int get value => _value;
}
