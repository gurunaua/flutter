import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Navigasi",
    home: new Halaman1(),
    routes: <String, WidgetBuilder>{
      '/hal1': (BuildContext context) => new Halaman1(),
      '/hal2': (BuildContext context) => new Halaman2(),
    },
  ));
}

class Halaman1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hal 1"),
      ),
      body: new Center(
        child: new IconButton(
            icon: new Icon(
              Icons.directions_run,
              size: 50.0,
            ),
            onPressed:(){
              Navigator.pushNamed(context, "/hal2");
            }),
      ),
    );
  }
}

class Halaman2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hal 2"),
      ),
      body: new Center(
        child: new IconButton(
            icon: new Icon(
              Icons.backspace,
              size: 50.0,
            ),
            onPressed: (){
              Navigator.pushNamed(context, "/hal1");
            }),
      ),
    );
  }
}
