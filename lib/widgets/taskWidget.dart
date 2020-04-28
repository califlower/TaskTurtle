import 'package:TaskTurtle/models/favesModel.dart';
import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

typedef CompleteTask = Function(TaskModel t);

class TaskWidget {
  Widget buildTaskWidget(TaskModel task) {
    return Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Color(0xff012235),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.all(7.0),
                              child: Text(task.title,
                                  style: TextStyle(color: Colors.white)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.all(7.0),
                              child: Text(task.deadline,
                                  style: TextStyle(color: Colors.white)))),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Consumer<FavesModel>(builder: (context, model, child) {
                      return FlatButton(
                          onPressed: () {
                            model.addRemoveFave(task);
                          },
                          child: model.faveList.contains(task)
                              ? Text("Unpin")
                              : Text("Pin"),
                          color: Color(0xff22eae0));
                    }),
                    if (task.subtasks.length == 0)
                      Consumer<TaskModel>(builder: (context, model, child) {
                        return FlatButton(
                            onPressed: () {
                              model.setIsDone(task, true);
                            },
                            child: Text("Complete"),
                            color: Color(0xff22eae0));
                      })
                  ],
                )
              ],
            ),
            Consumer<TaskModel>(builder: (context, model, child) {
              return LinearPercentIndicator(
                  center: Text(
                    (model.getCompletion(task) * 100).toString() + "%",
                    style: TextStyle(color: Colors.white),
                  ),
                  lineHeight: 14,
                  percent: model.getCompletion(task),
                  backgroundColor: Colors.blueGrey,
                  progressColor: Color(0xffe60efe));
            }),
          ],
        ));
  }
}
