import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Ini Judul",
    home: new CobaTap(),
  ));
}

class CobaTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        leading: new Icon(Icons.card_giftcard),
        title: new Text("Coba Tap Name"),
        actions: <Widget>[
          new Icon(Icons.search),
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Center(
              child: new Row(children: <Widget>[
                new Icon(Icons.access_alarm, size: 60.0, color: Colors.red),
                new Icon(Icons.access_alarm, size: 60.0, color: Colors.red),
              ],),
            ),
            new Icon(Icons.access_alarm, size: 60.0, color: Colors.purpleAccent),
            new Icon(Icons.access_alarms, size: 60.0, color: Colors.greenAccent),
            new Icon(Icons.access_time, size: 60.0, color: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}
