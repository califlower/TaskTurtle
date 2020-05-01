import 'package:TaskTurtle/models/favesModel.dart';
import 'package:TaskTurtle/models/taskModel.dart';
import 'package:TaskTurtle/widgets/faveWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/taskTreeModel.dart';
import 'widgets/taskListWidget.dart';

void main() {
  runApp(TaskTurtle());
}

class TaskTurtle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TaskTreeModel()),
          ChangeNotifierProvider(create: (context) => TaskModel()),
          ChangeNotifierProvider(create: (context) => FavesModel()),
        ],
        child: MaterialApp(
          title: 'Task Turtle',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'TaskTurtle'),
        ));
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
            FavoritesListWidget(),
            Expanded(
              child: TaskListWidget()
            ),
          ],
        ));
  }
}
