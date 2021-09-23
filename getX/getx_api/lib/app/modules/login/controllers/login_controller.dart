import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  late TextEditingController usernameC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameC = TextEditingController();
    passwordC = TextEditingController();
  }
}
