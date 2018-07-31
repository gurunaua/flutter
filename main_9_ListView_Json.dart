import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new HOme(),
  ));
}

class HOme extends StatefulWidget {
  @override
  _HOmeState createState() => _HOmeState();
}

class _HOmeState extends State<HOme> {
  List dataJson;

  Future<String> getData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJson = JSON.decode(hasil.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Judul"),
      ),
      body: new ListView.builder(
        itemCount: dataJson == null ? 0 : dataJson.length,
        itemBuilder: (context, i) {
          return new Container(
              padding: EdgeInsets.all(5.0),
              child: new Card(
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                    child: new Column(
                      children: <Widget>[
                        new Center(
                          child: new Text(dataJson[i]['title'],
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.indigo)),
                        ),
                        new Text(
                          dataJson[i]['body'],
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.black38),
                        )
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
