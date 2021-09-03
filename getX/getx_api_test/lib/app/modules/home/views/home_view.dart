import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    var data = controller.data.value.data;
    pr
    return Scaffold(
      body: ListView(
        children: data!
            .map((data) => ListTile(
                  leading: FlutterLogo(size: 100.0),
                  title: Text("${data?.itemName}"),
                  onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("$data"), duration: Duration(seconds: 2))),
                ))
            .toList(),
      ),
    );
  }
}
