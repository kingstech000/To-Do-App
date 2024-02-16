// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, non_constant_identifier_names, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:todoapp/selection_list.dart';
import 'package:todoapp/screens/add_task_screen.dart';
// import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Widget> SelectionWidget = [
    // SelectionList(text: "Buy Egg"),
    // SelectionList(text: "Buy milk"),
    // SelectionList(text: "Buy Bread"),
  ];

  void deletedTask(bool task) {}

  void addSelectionList(String Text) {
    SelectionWidget.add(SelectionList(
      text: Text,
    ));
  }

  String tasktest = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: AddTaskScreen(
                    onchanged: (value) {
                      tasktest = value;
                    },
                    addCallBack: () {
                      setState(() {
                        addSelectionList(tasktest);
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 40,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'To-Do App',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "${SelectionWidget.length} tasks",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 40, right: 20),
              // height: 520,
              // width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: SelectionWidget[index],
                      onLongPress: () {
                        setState(() {
                          SelectionWidget.removeAt(index);
                        });
                        
                      });
                },
                itemCount: SelectionWidget.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
