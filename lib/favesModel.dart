import 'package:TaskTurtle/task.dart';
import 'package:flutter/cupertino.dart';

class FavesModel extends ChangeNotifier {
  final List<Task> faveList = [new Task(title: "hello", deadline: "yoo")];

  void deleteFave(int index) {
    faveList.removeAt(index);
    notifyListeners();
  }
}
