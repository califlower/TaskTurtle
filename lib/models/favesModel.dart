import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/cupertino.dart';

class FavesModel extends ChangeNotifier {
  final List<TaskModel> faveList = [];

  void addRemoveFave(TaskModel task) {
    if (!faveList.contains(task)) {
      faveList.add(task);
    } else {
      faveList.remove(task);
    }

    notifyListeners();
  }
}
