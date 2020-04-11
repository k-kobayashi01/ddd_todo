import 'package:flutter/material.dart';

enum ExceptionCode {
  taskId,
  taskTitle,
  taskDescription,
  taskDate,
}

class NullEmptyException implements Exception {
  final ExceptionCode code;

  NullEmptyException({@required this.code});
}
