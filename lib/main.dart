import 'package:flutter/material.dart';
import 'task.dart';
import 'forms.dart';
import 'shell.dart';

void main() {
  runApp(TaskTurtle());
}

class TaskTurtle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Turtle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TaskTurtle', tasks: [new Task(title: "Title", deadline:"00.00.0000")]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.tasks}) : super(key: key);

  final String title;
  final List<Task> tasks;

  @override
  _MyHomePageState createState() => _MyHomePageState(tasks);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.tasks);
  Task focused;
  bool adding;
  List<Task> tasks;

  void setFocused(Task t){
    setState(() {
      focused = t;
      adding = false;
    });
    print("clicked" + focused.title);
  }

  void showAdding(){
    setState(() {
      adding = true;
    });
  }

  void addItem(Task t){
    setState(() {
      tasks.add(t);
      adding = false;
      focused = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff010f1c),
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xff012235),
            height: 100,
            child: Center(child: Text("Some shit here", style: TextStyle(color: Colors.white))),
          ),
          Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: MainShell(tasks: tasks, showAdding: showAdding, setFocused: setFocused)
                ),
                Expanded(
                  flex: 2,
                  child: SubTasksShell(adding: adding, setFocused: setFocused, focused: focused, addItem: addItem,)
                ),
              ],
            ) 
          )
        ],
      )
    );
  }
}
