import 'package:ddd_todo_sample/common/exception.dart';

class TaskTitle {
  final String _title;

  TaskTitle(this._title) {
    if (_title == null || _title.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.taskTitle);
    }
  }

  String get title => _title;
}
