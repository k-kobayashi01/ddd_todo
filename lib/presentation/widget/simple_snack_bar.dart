import 'package:flutter/material.dart';

class SimpleSnackBar {
  void show(BuildContext context, {@required String message}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
