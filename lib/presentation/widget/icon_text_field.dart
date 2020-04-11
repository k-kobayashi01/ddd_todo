import 'package:flutter/material.dart';

class IconTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hint;

  IconTextField({
    @required this.controller,
    @required this.iconData,
    @required this.hint,
  });

  @override
  _IconTextFieldState createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          icon: Icon(widget.iconData),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
