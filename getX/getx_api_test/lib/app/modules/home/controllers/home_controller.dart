import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/list_respons_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var data = SomeRootEntity().obs;
  String json =
      ' {"browsers":{"firefox":{"name":"Firefox","pref_url":"about:config","releases":{"1":{"release_date":"2004-11-09","status":"retired","engine":"Gecko","engine_version":"1.7"}}}}} ';

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("Ready ${Get.arguments}");
    load();
  }

  void load() {
    SomeRootEntity root = SomeRootEntity.fromJson(jsonDecode(json));
    data = root.obs;
  }
}
