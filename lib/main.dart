import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';
import 'layout_widgets.dart';

void main() {
  runApp(TaskTurtle());
}

class TaskTurtle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskTreeModel(),
      child:MaterialApp(
        title: 'Task Turtle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'TaskTurtle'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  child: MainView()
                ),
                Expanded(
                  flex: 2,
                  child: SubView()
                ),
              ],
            ) 
          )
        ],
      )
    );
  }
}
