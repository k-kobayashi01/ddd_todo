import 'package:flutter/material.dart';

class DatePicker {
  Future<DateTime> show(BuildContext context, {DateTime initialDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2020, 12, 31),
    );
  }
}
