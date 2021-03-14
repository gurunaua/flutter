import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_getx/counter/logic.dart';
import 'package:get/get.dart';
import './counter/logic.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  CounterLogic counterLogic = Get.put(CounterLogic());
  // var cc = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(() {
            return Column(
              children: [
                Text(
                  "Angka ${counterLogic.count}",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Angka ${counterLogic.count}",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            );
          }),
        ),
        floatingActionButton: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () => {
                  // cc++,
                  counterLogic.increment()
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => {
                  counterLogic.downCrement()
                },
              ),
            ),
          ],
        ));
  }
}
