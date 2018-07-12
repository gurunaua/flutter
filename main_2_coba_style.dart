import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new CobaStyle(),
  ));
}

class CobaStyle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Container(
          color: Colors.brown[100],
          width: 200.0,
          height: 300.0,
          child: new Center(
            child: Icon(Icons.add_shopping_cart, color: Colors.greenAccent, size: 50.0,),
//            child: new Text(
//              "Coba Style"
//              ,style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: "Serif"),
//            ),
          ),
        ),
      )
    );
  }
}