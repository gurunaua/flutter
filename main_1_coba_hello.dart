import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new HelloTest(),
  ));
}

class HelloTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("Test Hello Bro"),
      )


    );
  }
}