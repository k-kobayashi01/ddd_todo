import 'package:ddd_todo_sample/common/exception.dart';

class TaskDate {
  final DateTime _date;

  TaskDate(this._date) {
    if (_date == null) throw NullEmptyException(code: ExceptionCode.taskDate);
  }

  DateTime get date => _date;
}
