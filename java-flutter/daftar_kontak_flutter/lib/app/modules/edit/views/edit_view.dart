import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kontak'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                  hintText: "contoh: 08121111111",
                  labelText: "No Telepon",
                  icon: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: Udin Jago",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: "contoh: test@gmail.com",
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('Edit'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
