import 'package:TaskTurtle/favesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesListWidget extends StatelessWidget {
  Widget _buildFavoriteItem(String title, String desc, int index) {
    return Consumer<FavesModel>(
      builder: (context, model, child) {
        return new Container(
          height: 55.0,
          width: 250.0,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Color(0xff012235),
              borderRadius: BorderRadius.all(Radius.circular(1))),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child:
                            Text(title, style: TextStyle(color: Colors.white)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:
                            Text(desc, style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        padding: EdgeInsets.all(-10.0),
                        color: Colors.white,
                        onPressed: () {
                          model.deleteFave(index);
                        },
                        child: new Text("Remove"),
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _builtFavoritesList() {
    return Consumer<FavesModel>(builder: (context, model, child) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          // ignore: missing_return
          itemBuilder: (context, index) {
            if (index < model.faveList.length) {
              return _buildFavoriteItem(model.faveList[index].title,
                  model.faveList[index].deadline, index);
            }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavesModel>(builder: (context, model, child) {
      return Container(height: 150, child: _builtFavoritesList());
    });
  }
}
