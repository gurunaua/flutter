import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Obx(() => controller.selectedImagePath == ''
              ? Text('Select dari galery/camera')
              : Image.file(File(controller.selectedImagePath.value))),
          SizedBox(
            height: 30,
          ),
          Obx(() => controller.selectedImageSize == ''
              ? Text('')
              : Text(controller.selectedImageSize.value)),
          RaisedButton(
            onPressed: () {
              controller.getImage(ImageSource.camera);
            },
            child: Text("Camerea"),
          ),
          RaisedButton(
            onPressed: () {
              controller.getImage(ImageSource.gallery);
            },
            child: Text("Galery"),
          )
        ],
      )),
    );
  }
}
