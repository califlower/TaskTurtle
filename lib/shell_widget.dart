import 'package:flutter/material.dart';
import 'task.dart';

class Shell extends StatelessWidget {
  Shell({Key key, this.tasks, this.title, this.description}) : super(key: key);

  //Shell Title
  final String title;
  final String description;

  List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
