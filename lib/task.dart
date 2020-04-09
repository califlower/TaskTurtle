import 'package:flutter/material.dart';

class Task extends StatefulWidget{
  Task(this.title, this.deadline);

  final String title;
  final DateTime deadline;
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String title;
  DateTime deadline;
  List subtasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("$widget.title"),
        Text("$widget.deadline")
      ],
    );
  }


}