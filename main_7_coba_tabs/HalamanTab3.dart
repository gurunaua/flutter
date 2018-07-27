import 'package:flutter/material.dart';

class HalTab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Ini Hal Tab 3", style: new TextStyle( fontSize: 40.0, color: Colors.purple),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.home, color: Colors.greenAccent, size: 60.0,)
          ],
        ),
      ),
    );
  }
}
