// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  VoidCallback? onpressed;
  CustomAddButton({this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      color: Colors.lightBlueAccent,
      onPressed: onpressed,
      height: 35,
      minWidth: 400,
      child: Text(
        "Add",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
