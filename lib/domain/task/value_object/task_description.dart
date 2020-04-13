import 'package:ddd_todo_sample/common/exception.dart';

class TaskDescription {
  final String _value;

  TaskDescription(this._value) {
    if (_value.length > 200) {
      throw LengthException(code: ExceptionCode.taskDescription);
    }
  }

  String get value => _value;
}
