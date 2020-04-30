import 'dart:collection';

import 'package:flutter/widgets.dart';

class TaskModel extends ChangeNotifier {
  int id;
  String title;
  String deadline; //OR DateTime?
  bool isDone;
  List<TaskModel> path;
  List<TaskModel> subtasks;

  TaskModel({this.id, this.title, this.deadline, this.path}) {
    isDone = false;
    subtasks = [];
  }

  void setIsDone(TaskModel task, bool isDone) {
    task.isDone = isDone;
    notifyListeners();
  }

  double getCompletion(TaskModel task) {
    if (task.subtasks.length == 0) {
      return task.isDone ? 1 : 0;
    }
    double done = 0.0;
    task.subtasks.forEach((element) {
      element.isDone ? done++ : done = done;
    });
    return done / task.subtasks.length;
  }
}
