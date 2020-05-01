import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'colors.dart';
import '../models/taskTreeModel.dart';
import 'addTaskFormWidget.dart';
import 'hand_cursor.dart';
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
              children: <Widget>[
                _focusedPath(model),
                _widgetList(model),
              ]
            ),
            endDrawer: _drawerWidget(model),
            backgroundColor: Color(0xff010f1c),
            floatingActionButton: new Builder(
              builder: (context) {
                return CustomCursor(
                  cursorStyle: CustomCursor.pointer,
                  child: FloatingActionButton(
                    onPressed: Scaffold.of(context).openEndDrawer,
                    child: new Icon(Icons.add),
                    backgroundColor: Color(0xff22eae0),
                  )
                );
              }
            )
          );
        })
    );
  }

  Widget _focusedPath(TaskTreeModel model){
    if(model.focused == null){
      model.setFocused(model.root);
    }
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff010f1c),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Row(
        children: model.focused.path.map((t) => Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child:GestureDetector(
              onTap: () => model.setFocused(t),
              child: Text(" " + truncateWithEllipsis(5,t.title) + " / ", style: TextStyle(color: Palette.TEAL),),
            )
          )
        )
        ).toList() 
        + [Padding(padding: EdgeInsets.symmetric(vertical: 5), child: CustomCursor(cursorStyle:CustomCursor.pointer,child:GestureDetector(onTap: (){}, child: Text(model.focused.title + " /", style: TextStyle(color: Palette.TEAL),),)))]
      )
    );
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
  }

  Widget _widgetList(TaskTreeModel model){
    if(model.focused==null){
      model.setFocused(model.root);
    }
    if(model.focused.id == 0)
      return Column(
        children: model.items.map((e) => 
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
                onTap: () => model.setFocused(e),
                child: Consumer<TaskModel>(
                    builder: (context, taskModel, child) {
                  return TaskWidget().buildTaskWidget(e);
                }))))
        .toList());
    else
      return Column(
        children: [Padding(padding: EdgeInsets.all(1) ,child:Consumer<TaskModel>(builder: (context, value, child) => TaskWidget().buildTaskWidget(model.focused),))] + model.items.map((e) => 
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
                onTap: () => model.setFocused(e),
                child: Consumer<TaskModel>(
                    builder: (context, taskModel, child) {
                  return TaskWidget().buildTaskWidget(e);
                }))))
        .toList());
  }

  Widget _drawerWidget(TaskTreeModel model){
    if(model.focused == null){
      model.setFocused(model.root);
    }
    return Container(
      width: 650,
      decoration: BoxDecoration(
        color: Color(0xff010f1c),
      ),
      child: Drawer(
        child: Scaffold(
          body: Column(
            children: <Widget>[
                if(model.focused.id != 0)
                  TaskWidget().buildTaskWidget(model.focused),
                Container(
                  padding: EdgeInsets.all(25.0),
                  child: AddForm(model.focused, model.addTask),
                )
            ],
          ),
          backgroundColor: Color(0xff010f1c),
        ),
      ),
    );
  }
}