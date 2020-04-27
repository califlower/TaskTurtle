import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskTreeModel extends ChangeNotifier {
  final List<Task> rootTasks = [];
  int total = 0;
  Task focused;
  bool adding;
  bool addingSubtask;

  UnmodifiableListView<Task> get items => UnmodifiableListView(rootTasks);

  int get size => total;

  void addRootTask(Task t){
    rootTasks.add(t);
    total = total + 1;
    adding = false;
    notifyListeners(); 
  }

  void addLeafTask(Task p, Task c){
    p.subtasks.add(c);
    addingSubtask = false;
    notifyListeners();
  }

  void completeLeafTask(Task c){
    c.isDone = true;
    notifyListeners();
  }

  void showAddForm(){
    focused = null;
    adding = true;
    notifyListeners();
  }

  void showAddSubForm(){
    if(focused != null){
      addingSubtask = true;
      notifyListeners();
    }
  }

  void setFocused(Task t){
    focused = t;
    adding = false;
    notifyListeners();
  }

}

class Task{
  Task({this.title, this.deadline}){
    isDone = false; 
    subtasks = [];
  } 

  int id;
  String title;
  String deadline; //OR DateTime?
  bool isDone;
  List<Task> subtasks;
}

typedef CompleteTask = Function(Task t);

class TaskWidget extends StatefulWidget{
  TaskWidget({Key key, this.task, this.complete}) : super(key: key);

  final Task task;
  final CompleteTask complete;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  
  double completion;

  void completeTask(){
    setState(() {
      completion = 1;
    });
    widget.complete(widget.task);
  }

  double getCompletion(){
    if(widget.task.subtasks.length == 0){return widget.task.isDone ? 1 : 0;}
    double done = 0.0;
    widget.task.subtasks.forEach((element) {element.isDone ? done++ : done = done;});
    return done / widget.task.subtasks.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xff012235),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft, 
                    child: Container(padding: EdgeInsets.all(7.0),child:Text(widget.task.title, style: TextStyle(color: Colors.white)))
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(padding:EdgeInsets.all(7.0), child: Text(widget.task.deadline, style: TextStyle(color: Colors.white)))
                  ),
                ],),
              ),
            if(widget.task.subtasks.length == 0)
              FlatButton(
                onPressed: completeTask,
                child:Text("Complete"),
                color: Color(0xff22eae0)
              )
            ],),
          LinearPercentIndicator(
            center: Text((getCompletion()*100).toStringAsFixed(0)+"%", style: TextStyle(color: Colors.white),),
            lineHeight: 14, 
            percent: getCompletion(),
            backgroundColor: Colors.blueGrey, 
            progressColor: Color(0xffe60efe)),
        ], 
      )
    ); 
    
  }
}
