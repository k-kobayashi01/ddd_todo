import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  final DateTime dateTime;

  DateText({@required this.dateTime});

  @override
  Widget build(BuildContext context) {
    if (dateTime == null) return Text('');
    return Text(DateFormat('MM/dd').format(dateTime));
  }
}
