import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Coba Parsing",
    home: new Hal1(),
  ));
}

class Hal1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Coba Parsing Variable"),
      ),
      body:new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new CardMe(icon: Icons.home, text: "HOme", warna: Colors.green,),
            new CardMe(icon: Icons.account_circle, text: "Contact", warna: Colors.blue,),
            new CardMe(icon: Icons.home, text: "HOme", warna: Colors.brown,),

          ],
        ),
      ),
    );
  }

}


class CardMe extends StatelessWidget{

  CardMe({this.icon, this.text, this.warna});
  final IconData icon;
  final String text;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Icon(icon, size: 55.0, color: warna,),
            new Text(text, style: TextStyle(fontSize: 40.0),)
          ],
        ),
      ),
    );
  }

}

