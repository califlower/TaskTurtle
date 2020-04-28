import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/taskTreeModel.dart';
import 'addTaskFormWidget.dart';
import 'taskWidget.dart';

typedef Add = void Function();
typedef Focus = void Function(TaskModel t);
typedef AddItem = void Function(TaskModel t);

class TaskListWidget extends StatelessWidget {
  TaskListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Color(0xff010f1c),
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Consumer<TaskTreeModel>(builder: (context, model, child) {
          return Scaffold(
            body: Column(
                children: model.items
                    .map((e) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                            onTap: () => model.setFocused(e),
                            child: Consumer<TaskModel>(
                                builder: (context, taskModel, child) {
                              return TaskWidget().buildTaskWidget(e);
                            }))))
                    .toList()),
            backgroundColor: Color(0xff010f1c),
            floatingActionButton: FloatingActionButton(
              onPressed: model.showAddForm,
              child: new Icon(Icons.add),
              backgroundColor: Color(0xff22eae0),
            ),
          );
        }));
  }
}

class SubView extends StatelessWidget {
  SubView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff010f1c),
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Consumer<TaskTreeModel>(builder: (context, model, child) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                if (model.adding == false)
                  if (model.focused != null) ...[
                    TaskWidget().buildTaskWidget(model.focused),
                    if (model.addingSubtask == true) ...[
                      Container(
                          padding: EdgeInsets.all(25.0),
                          child:
                              AddSubtaskForm(model.focused, model.addLeafTask))
                    ],
                    Container(
                        child: Column(
                            children: model.focused.subtasks
                                .map((s) => Padding(
                                    padding: EdgeInsets.all(20),
                                    child: GestureDetector(
                                        onTap: () => model.setFocused,
                                        child:
                                            TaskWidget().buildTaskWidget(s))))
                                .toList()))
                  ],
                if (model.adding == true)
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: AddForm(model.addRootTask),
                  )
              ],
            ),
            backgroundColor: Color(0xff010f1c),
            floatingActionButton: FloatingActionButton(
              onPressed: model.showAddSubForm,
              child: new Icon(Icons.add),
              backgroundColor: Color(0xff22eae0),
            ),
          );
        }));
  }
}
