import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Turtle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TaskTurtle'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            child: Container(
              color: Color(0xff010f1c),
            ),
          )
        ],
      )
    );
  }
}
