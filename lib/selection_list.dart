// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class SelectionList extends StatefulWidget {
  SelectionList({super.key, required this.text, this.onLongpress});
  final GestureLongPressCallback? onLongpress;

  String text;

  @override
  State<SelectionList> createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  bool onSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                fontSize: 20,
                decoration: onSelected
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: onSelected,
            onChanged: (value) {
              setState(
                () {
                  if (onSelected == false) {
                    onSelected = true;
                  } else {
                    onSelected = false;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
