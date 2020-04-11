import 'package:ddd_todo_sample/common/exception.dart';

class TaskDescription {
  final String _description;

  TaskDescription(this._description) {
    if (_description == null || _description.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.taskDescription);
    }
  }

  String get description => _description;
}
