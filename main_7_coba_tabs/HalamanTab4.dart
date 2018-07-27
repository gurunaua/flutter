import 'package:flutter/material.dart';

class HalTab4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Ini Hal Tab4", style: new TextStyle( fontSize: 40.0, color: Colors.indigo),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.add_a_photo, color: Colors.greenAccent, size: 60.0,)
          ],
        ),
      ),
    );
  }
}
