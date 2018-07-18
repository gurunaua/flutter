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
          new Icon(Icons.card_giftcard),
          new Text("XX"),
          new Radio(value: null, groupValue: null, onChanged: null),
        ],
      ),
    );
  }
}
