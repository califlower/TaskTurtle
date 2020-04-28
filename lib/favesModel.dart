import 'package:TaskTurtle/task.dart';
import 'package:flutter/cupertino.dart';

class FavesModel extends ChangeNotifier {
  final List<Task> faveList = [];

  void deleteFave(int index) {
    faveList.removeAt(index);
    notifyListeners();
  }

  void addRemoveFave(Task task) {
    if (!faveList.contains(task)) {
      faveList.add(task);
    } else {
      faveList.remove(task);
    }

    notifyListeners();
  }
}
