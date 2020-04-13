class TaskUpdateCommand {
  final int _id;
  final String _title;
  final String _description;
  final DateTime _date;

  TaskUpdateCommand({
    int id,
    String title,
    String description,
    DateTime date,
  })  : _id = id,
        _title = title,
        _description = description,
        _date = date;

  int get id => _id;
  String get title => _title;
  String get description => _description;
  DateTime get date => _date;
}
