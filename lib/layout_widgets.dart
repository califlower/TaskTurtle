import 'package:flutter/material.dart';
import 'task.dart';
import 'forms.dart';

typedef Add = void Function();
typedef Focus = void Function(Task t);
typedef AddItem = void Function(Task t);

class MainView extends StatelessWidget{
  MainView({Key key, this.tasks, this.showAdding, this.setFocused}) : super(key: key);

  List<Task> tasks;
  Add showAdding;
  Focus setFocused;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Color(0xff010f1c),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Scaffold(
        body:Column(children: tasks.map(
          (e) => Padding(
            padding: EdgeInsets.symmetric(vertical:10),
            child:GestureDetector(
              onTap: () => setFocused(e),
              child:TaskWidget(task:e))
            )
          ).toList()
        ),
        backgroundColor: Color(0xff010f1c),
        floatingActionButton: FloatingActionButton(
          onPressed: showAdding,
          child: new Icon(Icons.add),
          backgroundColor: Color(0xff22eae0),
        ),
      )
    );
  }
}

class SubView extends StatelessWidget {
  SubView({Key key, this.adding, this.focused, this.setFocused, this.addItem}) : super(key: key);
  
  bool adding;
  Task focused;
  Focus setFocused;
  AddItem addItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff010f1c),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Column(
        children: <Widget>[
          if(adding == false)
            if(focused != null)...[
              TaskWidget(task:focused),
              Container(child: Column(children: focused.subtasks.map((s) => GestureDetector(
                onTap: ()=>setFocused(s), 
                child:TaskShell(task:s)
              )).toList()))
            ],
          if(adding == true)
            Container(
              padding: EdgeInsets.all(25.0),
              child: AddForm(addItem),
            )
        ],
      )
    );
  }

}