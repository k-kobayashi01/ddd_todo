import 'package:ddd_todo_sample/common/exception.dart';

class TaskDate {
  DateTime _value;

  TaskDate(DateTime value) {
    if (value == null) throw NullEmptyException(code: ExceptionCode.taskDate);
    this._value = value;
  }

  TaskDate.fromString(String value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.taskDate);
    }
    this._value = DateTime.parse(value);
  }

  DateTime get value => _value;
}
