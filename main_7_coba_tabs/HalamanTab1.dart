import 'package:flutter/material.dart';

class HalTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Ini Hal Tab 1", style: new TextStyle( fontSize: 40.0, color: Colors.green),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.add_to_queue, color: Colors.greenAccent, size: 60.0,)
          ],
        ),
      ),
    );
  }
}
