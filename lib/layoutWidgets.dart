import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/taskTreeModel.dart';
import 'widgets/addTaskFormWidget.dart';
import 'widgets/taskWidget.dart';

typedef Add = void Function();
typedef Focus = void Function(Task t);
typedef AddItem = void Function(Task t);

class MainView extends StatelessWidget {
  MainView({Key key}) : super(key: key);

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
                            child: TaskWidget(
                              task: e,
                              complete: model.completeLeafTask,
                            ))))
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
                    TaskWidget(task: model.focused),
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
                                        child: TaskWidget(
                                          task: s,
                                          complete: model.completeLeafTask,
                                        ))))
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
