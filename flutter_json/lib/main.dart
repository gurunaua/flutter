import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json/person2.dart';
import 'package:flutter_json/person.dart';
import 'package:flutter_json/person3.dart';
import 'package:flutter_json/person4.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.lightBlue,
      accentColor: Colors.black54,
      primarySwatch: Colors.red,
    ),
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _json = "";
  String _json2 = "";
  String _json3 = "";
  String _json4 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Json"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      //TODO
                      _loadJson();
                      _loadJson2();
                      _loadJson3();
                      _loadJson4();
                    },
                    child: Text("Read Json File"),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  _json,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  _json2,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  _json3,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  _json4,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _loadJson() async {
    String jsonString = await rootBundle.loadString("assets/person.json");
    final jsonData = json.decode(jsonString);
    Person person = Person.fromJson(jsonData);
    setState(() {
      _json = person.toString();
    });
  }

  Future _loadJson2() async {
    String jsonString = await rootBundle.loadString("assets/person2.json");
    final jsonData = json.decode(jsonString);
    Person2 person = Person2.fromJson(jsonData);
    setState(() {
      _json2 = person.toString();
    });
  }

  Future _loadJson3() async {
    String jsonString = await rootBundle.loadString("assets/person3.json");
    final jsonData = json.decode(jsonString);
    Person3 person = Person3.fromJson(jsonData);
    setState(() {
      _json3 = person.toString();
    });
  }

  Future _loadJson4() async {
    String jsonString = await rootBundle.loadString("assets/person4.json");
    final jsonData = json.decode(jsonString);
    Person4 person = Person4.fromJson(jsonData);
    setState(() {
      _json4 = person.toString();
    });
  }

}
