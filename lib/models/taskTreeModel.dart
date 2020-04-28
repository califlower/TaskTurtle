import 'dart:collection';

import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/cupertino.dart';

class TaskTreeModel extends ChangeNotifier {
  final List<TaskModel> rootTasks = [];
  int total = 0;
  TaskModel focused;
  bool adding;
  bool addingSubtask;

  UnmodifiableListView<TaskModel> get items => UnmodifiableListView(rootTasks);

  int get size => total;

  void addRootTask(TaskModel t) {
    rootTasks.add(t);
    total = total + 1;
    adding = false;
    notifyListeners();
  }

  void addLeafTask(TaskModel p, TaskModel c) {
    p.subtasks.add(c);
    addingSubtask = false;
    notifyListeners();
  }

  void showAddForm() {
    focused = null;
    adding = true;
    notifyListeners();
  }

  void showAddSubForm() {
    if (focused != null) {
      addingSubtask = true;
      notifyListeners();
    }
  }

  void setFocused(TaskModel t) {
    focused = t;
    adding = false;
    notifyListeners();
  }
}
