import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_controller.dart';
import '../../home/controllers/home_controller.dart';

class AddView extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.find<HomeController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('AddView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.nameC,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.emailC,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.phoneC,
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                  onEditingComplete: () => {},
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.add();
                    homeC.loadUsers();
                    Get.back();
                  },
                  child: Text("Add product"),
                )
              ],
            ),
          ),
        ));
  }
}
