import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new ListViewPage(data: new List<String>.generate(200, (i)=>"Isi $i"),),
  ));
}

class ListViewPage extends StatelessWidget {

  final List<String> data;

  ListViewPage({this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(title: new Text("List Viwe"),),
      body: new Container(
        child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            return new ListTile(
              leading: new Icon(Icons.account_circle , size: 100.0,),
              title: new Text("${data[index]}"),
            );
          },
        ),
      ),
    );
  }

}
