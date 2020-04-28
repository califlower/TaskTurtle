import 'package:TaskTurtle/faveWidget.dart';
import 'package:TaskTurtle/favesModel.dart';
import 'package:TaskTurtle/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layoutWidgets.dart';

void main() {
  runApp(TaskTurtle());
}

class TaskTurtle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TaskTreeModel()),
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
                child: Row(
              children: <Widget>[
                Expanded(flex: 3, child: MainView()),
                Expanded(flex: 2, child: SubView()),
              ],
            ))
          ],
        ));
  }
}
