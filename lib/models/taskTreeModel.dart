import 'dart:collection';

import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/cupertino.dart';

class TaskTreeModel extends ChangeNotifier {
  final TaskModel root = new TaskModel(id: 0, title: "", path: []);
  int total = 0;
  TaskModel focused;
  bool adding;
  bool addingSubtask;

  UnmodifiableListView<TaskModel> get items => UnmodifiableListView(focused.subtasks);

  int get size => total;

  // void addRootTask(TaskModel t) {
  //   addLeafTask(root, t);
  //   // rootTasks.add(t);
  //   total = total + 1;
  //   adding = false;
  //   notifyListeners();
  // }

  // void addLeafTask(TaskModel p, TaskModel c) {
  //   p.subtasks.add(c);
  //   addingSubtask = false;
  //   notifyListeners();
  // }

  void addTask(TaskModel p, TaskModel c){
    if(p==null){
      root.subtasks.add(c);
      focused = root;
      return;
    }
    p.subtasks.add(c);
    focused = p;
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
    if(t == null){focused = root; return;}
    focused = t;
    adding = false;
    notifyListeners();
  }
}
