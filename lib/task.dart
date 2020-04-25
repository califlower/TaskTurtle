import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Task{
  Task({this.title, this.deadline}){
    isDone = false; 
    subtasks = [];
  } 

  String title;
  String deadline; //OR DateTime?
  bool isDone;
  List<Task> subtasks;

  // double completion(){
  //   if(subtasks.length == 0){return isDone ? 1 : 0;}
  //   double done = 0.0;
  //   subtasks.forEach((element) {element.isDone ? done++ : done = done;});
  //   return done / subtasks.length;
  // }
}


class TaskShell extends StatefulWidget{
  TaskShell({Key key, this.task}) : super(key: key);

  final Task task;

  @override
  _TaskShellState createState() => _TaskShellState();
}

class _TaskShellState extends State<TaskShell> {
  
  double completion;

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
          Align(
            alignment: Alignment.centerLeft, 
            child: Container(padding: EdgeInsets.all(7.0),child:Text(widget.task.title, style: TextStyle(color: Colors.white)))
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(padding:EdgeInsets.all(7.0), child: Text(widget.task.deadline, style: TextStyle(color: Colors.white)))
          ),
          LinearPercentIndicator(
            center: Text((getCompletion()*100).toStringAsFixed(0)+"%", style: TextStyle(color: Colors.white),),
            lineHeight: 14, 
            percent: getCompletion(),
            backgroundColor: Colors.blueGrey, 
            progressColor: Color(0xffe60efe)),
            // if(widget.task.subtasks.length == 0)
              // FlatButton(
              //   onPressed: () => print("completed"),
              //   child:Text("Complete"),
              //   color: Colors.blue
              // )
        ], 
      )
    ); 
    
  }


}