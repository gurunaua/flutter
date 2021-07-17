import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_get_x/app/util/UiUtil.dart';
import 'dart:io';

import '../../../data/models/user_model.dart';
import '../../../data/providers/user_provider.dart';

class HomeController extends GetxController {
  var users = List<User>.empty().obs;
  var isLoading = true.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    print("HOME Ready");
  }

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() async {
    try {
      print("loadUsers()");
      isLoading(true);
      List<User> usersResponse = await UserProvider().getUserAll();
      if (usersResponse != null && usersResponse.length > 0) {
        users = List<User>.empty().obs;
        usersResponse.forEach((element) {
          users.add(element);
        });
      }

      if (usersResponse.length == 0) users = List<User>.empty().obs;
    } catch (e) {
      print("error : ${e}");
      UiUTIL.dialogError("error : ${e}");
    } finally {
      isLoading(false);
    }
  }

  void showSnackBarError() {
    Get.snackbar("Eror", "salah", duration: Duration(seconds: 2));
  }

  // void add(String name, String email, String phone) {
  //   users.add(User(id: 'id', email: email, name: name, phone: phone));
  //   Get.back();
  // }

  void delete(String id) async {
    try {
      print("home delete");
      isLoading(true);
      await UserProvider().deleteUser(id);
    } catch (e) {
      print("error : ${e}");
      UiUTIL.dialogError("error : ${e}");
    } finally {
      loadUsers();
    }
  }
}
