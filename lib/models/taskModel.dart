import 'package:flutter/widgets.dart';

class TaskModel extends ChangeNotifier {
  int id;
  String title;
  String deadline; //OR DateTime?
  bool isDone;
  List<TaskModel> subtasks;

  TaskModel({this.title, this.deadline}) {
    isDone = false;
    subtasks = [];
  }

  void setIsDone(bool isDone) {
    this.isDone = isDone;
    notifyListeners();
  }
}
