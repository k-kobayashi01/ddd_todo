import 'package:flutter/material.dart';

class TaskCreateNotifier with ChangeNotifier {
  String _title;
  String _description;
  DateTime _date;

  String get title => _title;
  String get description => _description;
  DateTime get date => _date;

  void setTitle(String newTitle) {
    _title = newTitle;

    notifyListeners();
  }

  void setDescription(String newDescription) {
    _description = newDescription;

    notifyListeners();
  }

  void setDate(DateTime newDate) {
    if (newDate == null) return;
    _date = newDate;

    notifyListeners();
  }
}
