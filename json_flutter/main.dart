import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testjson/model/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String result = "Result : ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test Json"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Load Json'),
                onPressed: () {_loadPersonJson();},
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }


  Future _loadPersonJson()async{
    String jsonString = await rootBundle.loadString("assets/person.json");
    final data = json.decode(jsonString);
    Person person = Person.fromJson(data);
    setState(() {
      result = "Result : "+ person.toString();
    });
  }

}

