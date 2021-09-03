import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_api/app/routes/app_pages.dart';
import '../../../data/providers/login_request_provider.dart';
import '../../../data/login_request_model.dart';
import '../../../data/login_respons_model.dart';

class LoginController extends GetxController {
  late TextEditingController usernameC;
  late TextEditingController passwordC;

  var passwordVisible = 1.obs;
  var password = "".obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    usernameC = TextEditingController();
    passwordC = TextEditingController();
  }

  void passwordVisibleView() {
    passwordVisible = passwordVisible.value == 1 ? 0.obs : 1.obs;
    print("==> $passwordVisible");
  }

  Future<void> login() async {
    isLoading = true.obs;
    LoginRespons postLogin = await LoginRequestProvider()
        .postLogin(new LoginRequest(usr: "administrator", pwd: "admin"));
    if (postLogin.fullName != "") {
      Get.toNamed(Routes.HOME);
    }
    isLoading = false.obs;
  }
}
