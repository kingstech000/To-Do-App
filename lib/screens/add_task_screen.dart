// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoapp/custom_add_button.dart';


class AddTaskScreen extends StatelessWidget {

    final ValueChanged<String>? onchanged;
    VoidCallback? addCallBack;
    AddTaskScreen({required this.addCallBack, required this.onchanged});

  // final firstnameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 40, right: 40),
      child: Column(
        children: [
          Text(
            "Add task",
            style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent, fontWeight: FontWeight.w500),
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: onchanged,
            decoration: InputDecoration(
              hintText: "Enter your task",
              hintStyle: TextStyle(color: Colors.grey),
              focusColor: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CustomAddButton(
            onpressed: addCallBack,
          )
        ],
      ),
    );
  }
}


    