import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UiUTIL {
  static void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }
}
