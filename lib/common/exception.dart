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

class NotUniqueException implements Exception {
  final ExceptionCode code;

  NotUniqueException({@required this.code});
}

class LengthException implements Exception {
  final ExceptionCode code;

  LengthException({@required this.code});
}
