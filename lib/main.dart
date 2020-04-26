import 'package:flutter/material.dart';
import 'task.dart';

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
      home: Home(title: 'TaskTurtle', tasks: [new Task("hello", 'wow', new DateTime.now())]),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title, this.tasks}) : super(key: key);

  final String title;
  final List<Task> tasks;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: Color(0xff010f1c),
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    child: Column(children: widget.tasks.map((e) => TaskWidget(task:e)).toList()),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff010f1c),
                      border: Border.all(color: Colors.red, width: 1),
        
                    ),
                  ),
                ),
              ],
            ) 
          )
          
          
        ],
      )
    );
  }
}
