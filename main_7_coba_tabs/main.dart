import 'package:flutter/material.dart';
import 'HalamanTab1.dart' as hal1;
import 'HalamanTab2.dart' as hal2;
import 'HalamanTab3.dart' as hal3;
import 'HalamanTab4.dart' as hal4;

void main() {
  runApp(new MaterialApp(
    title: "Navigasi",
    home: new HOme(),
  ));
}

class HOme extends StatefulWidget {
  @override
  _HOmeState createState() => _HOmeState();
}

class _HOmeState extends State<HOme> with SingleTickerProviderStateMixin{

  TabController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Coba Tab"),
        backgroundColor: Colors.brown,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.add_to_queue), text: "TAB 1",),
            new Tab(icon: new Icon(Icons.backspace),text: "TAB 2",),
            new Tab(icon: new Icon(Icons.home), text: "TAB 3",),
            new Tab(icon: new Icon(Icons.add_a_photo),  text: "TAB 4",)
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new hal1.HalTab1(),
          new hal2.HalTab2(),
          new hal3.HalTab3(),
          new hal4.HalTab4()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.black38,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
          new Tab(icon: new Icon(Icons.add_to_queue),  ),
          new Tab(icon: new Icon(Icons.backspace), ),
          new Tab(icon: new Icon(Icons.home), ),
          new Tab(icon: new Icon(Icons.add_a_photo), )
        ],),
      ),
    );
  }
}
