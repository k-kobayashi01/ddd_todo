import 'package:ddd_todo_sample/common/exception.dart';

class TaskTitle {
  final String _value;

  TaskTitle(this._value) {
    if (_value == null || _value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.taskTitle);
    }
    if (_value.length > 100) {
      throw LengthException(code: ExceptionCode.taskTitle);
    }
  }

  String get value => _value;
}
