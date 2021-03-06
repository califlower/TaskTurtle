import 'package:TaskTurtle/models/taskModel.dart';
import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  AddForm(this.addNewItem);

  final addItemCallback addNewItem;

  @override
  AddFormState createState() => AddFormState();
}

typedef addItemCallback = void Function(TaskModel t);

class AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final date = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text("Create New Task",
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
          TextFormField(
            controller: title,
            style: TextStyle(
              color: Colors.white,
            ),
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                hintText: "Enter Task Title",
                labelText: "Title",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            validator: (value) {
              return ["", null].contains(value) ? "Enter a title!" : null;
            },
            autofocus: true,
          ),
          TextFormField(
            controller: date,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                hintText: "Deadline (optional)",
                labelText: "Deadline",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            keyboardType: TextInputType.datetime,
            validator: (value) {
              return null;
            },
          ),
          RaisedButton(
            color: Color(0xff22eae0),
            textColor: Color(0xff012235),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                widget.addNewItem(
                    new TaskModel(title: title.text, deadline: date.text));
              }
            },
            child: Text("Create"),
          )
        ],
      ),
    );
  }
}

typedef addSubtaskCallback = void Function(TaskModel p, TaskModel c);

class AddSubtaskForm extends StatefulWidget {
  AddSubtaskForm(this.focused, this.addNewItem);

  final TaskModel focused;
  final addSubtaskCallback addNewItem;

  @override
  AddSubtaskFormState createState() => AddSubtaskFormState();
}

class AddSubtaskFormState extends State<AddSubtaskForm> {
  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final date = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text("Create New SubTask",
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
          TextFormField(
            controller: title,
            style: TextStyle(
              color: Colors.white,
            ),
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                hintText: "Enter SubTask Title",
                labelText: "Title",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            validator: (value) {
              return ["", null].contains(value) ? "Enter a title!" : null;
            },
            autofocus: true,
          ),
          TextFormField(
            controller: date,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                hintText: "Deadline (optional)",
                labelText: "Deadline",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            keyboardType: TextInputType.datetime,
            validator: (value) {
              return null;
            },
          ),
          RaisedButton(
            color: Color(0xff22eae0),
            textColor: Color(0xff012235),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                widget.addNewItem(widget.focused,
                    new TaskModel(title: title.text, deadline: date.text));
              }
            },
            child: Text("Create"),
          )
        ],
      ),
    );
  }
}
