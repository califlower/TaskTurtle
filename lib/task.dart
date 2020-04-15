import 'package:flutter/material.dart';

class Task{
  String name;
  String deadline;
  bool isDone;
  List<Task> subtasks;

  Task(this.name, this.deadline){
    subtasks = [];
  }

  double completion(){
    double done = 0.0;
    subtasks.forEach((element) {element.isDone ? done++ : done = done;});
    return done / subtasks.length;
  }
}


class TaskShell extends StatefulWidget{
  TaskShell({Key key, this.title, this.deadline}) : super(key: key);

  final String title;
  final DateTime deadline;
  @override
  _TaskShellState createState() => _TaskShellState();
}

class _TaskShellState extends State<TaskShell> {
  String title;
  DateTime deadline;
  List subtasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.title, style: TextStyle(color: Colors.white),),
        Text(widget.deadline.toIso8601String(), style: TextStyle(color: Colors.white))
      ], 
    );
  }


}