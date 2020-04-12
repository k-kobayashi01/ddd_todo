import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCreateNotifier with ChangeNotifier {
  String _title;
  String _description;
  DateTime _date;

  String get title => _title;
  String get description => _description;
  DateTime get date => _date;
  String get dateString {
    if (_date == null) return '';
    return DateFormat('MM/dd').format(_date);
  }

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
