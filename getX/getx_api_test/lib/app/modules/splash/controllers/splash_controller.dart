import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_api/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    String? userPreff = await box.read('username');
    print('userPreff : ${userPreff}');

    // if (userPreff == null) {
    Timer(Duration(seconds: 1), () {
      Get.offAndToNamed(Routes.LOGIN);
    });
    // } else {
    // Get.offAndToNamed(Routes.HOME);
    // }
  }
}
