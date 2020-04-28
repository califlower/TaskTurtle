import 'dart:collection';

import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/cupertino.dart';

class TaskTreeModel extends ChangeNotifier {
  final List<Task> rootTasks = [];
  int total = 0;
  Task focused;
  bool adding;
  bool addingSubtask;

  UnmodifiableListView<Task> get items => UnmodifiableListView(rootTasks);

  int get size => total;

  void addRootTask(Task t) {
    rootTasks.add(t);
    total = total + 1;
    adding = false;
    notifyListeners();
  }

  void addLeafTask(Task p, Task c) {
    p.subtasks.add(c);
    addingSubtask = false;
    notifyListeners();
  }

  void completeLeafTask(Task c) {
    c.isDone = true;
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

  void setFocused(Task t) {
    focused = t;
    adding = false;
    notifyListeners();
  }
}
