import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_get_x/app/data/providers/user_provider.dart';
import 'package:test_get_x/app/util/UiUtil.dart';
import '../../../data/models/user_model.dart';

class ProfileController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("Ready ${Get.arguments}");
    loadUser();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    super.onClose();
  }

  void loadUser() async {
    try {
      print("loadUsers()");
      isLoading(true);
      User user = await UserProvider().getUser(Get.arguments);
      if (user != null) {
        nameC.text = user.name.toString();
        emailC.text = user.email.toString();
        phoneC.text = user.phone.toString();
      }
    } catch (e) {
      print("error : ${e}");
      UiUTIL.dialogError("error : ${e}");
    } finally {
      isLoading(false);
    }
  }

  void updateUser() async {
    User user = await UserProvider().updateUser(User(
      id: Get.arguments,
      phone: phoneC.text,
      email: emailC.text,
      name: nameC.text,
    ));
    if (user == null) {
      UiUTIL.dialogError("insert gagal");
    } else {
      Get.back();
    }
  }
}
