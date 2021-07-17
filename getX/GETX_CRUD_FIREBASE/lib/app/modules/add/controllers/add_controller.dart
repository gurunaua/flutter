import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/providers/user_provider.dart';
import '../../../data/models/user_model.dart';

class AddController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    super.onClose();
  }

  Future<void> add() async {
    User user = await UserProvider().postUser(User(
      id: null,
      phone: phoneC.text,
      email: emailC.text,
      name: nameC.text,
    ));
    if (user == null) {
      dialogError("insert gagal");
    } else {
      Get.back();
    }
  }
}
