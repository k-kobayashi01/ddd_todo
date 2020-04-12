class TaskCreateCommand {
  final String _title;
  final String _description;
  final DateTime _date;

  TaskCreateCommand({
    String title,
    String description,
    DateTime date,
  })  : _title = title,
        _description = description,
        _date = date;

  String get title => _title;
  String get description => _description;
  DateTime get date => _date;
}
