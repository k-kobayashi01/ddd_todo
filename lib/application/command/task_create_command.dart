class TaskCreateCommand {
  final String _title;
  final String _description;
  final DateTime _date;

  TaskCreateCommand(this._title, this._description, this._date);

  String get title => _title;
  String get description => _description;
  DateTime get date => _date;
}
