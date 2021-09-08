import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/app/data/providers/list_provider.dart';
import '../../../data/list_respons_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  var data = SomeRootEntity(data: List.empty()).obs;
  String json =
      ' {"data":[{"item_code":"no data","item_name":"no name","image":null,"normal_rate":0,"promo_rate":0}]} ';

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("Ready ${Get.arguments}");
    load();
  }

  void load() async {
    isLoading.value = true;
    SomeRootEntity response = await ListProvider().getList();
    if (response != null && response.data != null)
      data.value = response;
    else
      data.value = SomeRootEntity.fromJson(jsonDecode(json));

    print("hasil : ${data.value.data}");
    isLoading.value = false;
  }
}
