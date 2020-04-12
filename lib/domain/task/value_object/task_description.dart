import 'package:ddd_todo_sample/common/exception.dart';

class TaskDescription {
  final String _value;

  TaskDescription(this._value) {
    if (_value == null || _value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.taskDescription);
    }
  }

  String get value => _value;
}
