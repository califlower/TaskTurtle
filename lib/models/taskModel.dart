class Task {
  Task({this.title, this.deadline}) {
    isDone = false;
    subtasks = [];
  }

  int id;
  String title;
  String deadline; //OR DateTime?
  bool isDone;
  List<Task> subtasks;
}
