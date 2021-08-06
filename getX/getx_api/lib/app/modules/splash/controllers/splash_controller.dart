import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_api/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    print("asdasdsd xxxxx");
    Timer(Duration(seconds: 1), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }
}
