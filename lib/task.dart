import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Task {
  final bool isDone = false;
  final String name;
  final String description;
  final DateTime deadline;

  Task(this.name, this.description, this.deadline);
}

class TaskWidget extends StatefulWidget {
  final Task task;

  TaskWidget({Key key, this.task}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Color(0xff012235),
            // border: Border.all(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.all(7.0),
                    child: Text(widget.task.name,
                        style: TextStyle(color: Colors.white)))),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.all(7.0),
                    child: Text(widget.task.deadline.toString(),
                        style: TextStyle(color: Colors.white)))),
          ],
        ));
  }
}
