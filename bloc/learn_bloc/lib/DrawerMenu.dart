import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('Menu', style:  TextStyle(color: Colors.white),),
            ),
            decoration: BoxDecoration(
              color: Colors.teal
            ),
          ),
          getLine(),
          getListTile("Home", onTap: (){
            Navigator.pushReplacementNamed(context, '/');
          }),
          getListTile("About", onTap: (){
            Navigator.pushReplacementNamed(context, '/about');
          }),
          getLine(),
          getListTile("Setting", onTap: (){
            Navigator.pushReplacementNamed(context, '/settings');
          }),

        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
  Widget getListTile(title, {Function onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
