import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'dart:developer';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  String url = "https://test-getx-2a57e-default-rtdb.firebaseio.com/";

  Future<List<User>> getUserAll() async {
    final response = await get("${url}user_aan.json");
    List<User> list = [];
    if (response != null &&
        response.bodyString != null &&
        response.bodyString != "null") {
      print(response.bodyString.toString());
      Map usersMap = jsonDecode(response.bodyString.toString());

      usersMap.forEach((key, value) {
        list.add(User(
            id: key,
            email: value["email"],
            name: value["name"],
            phone: value["phone"]));
      });
    }
    return list;
  }

  Future<User> getUser(String id) async {
    var response = await get("${url}user_aan/${id}.json");
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      Map usersMap = jsonDecode(response.bodyString.toString());
      return User(
          id: id,
          email: usersMap["email"],
          name: usersMap["name"],
          phone: usersMap["phone"]);
    } else {
      return User(id: id);
    }
  }

  Future<User> postUser(User user) async {
    user.id = null;
    print("user : ${user.name.toString()}");
    final response = await post(
      "${url}user_aan.json",
      {
        "name": user.name,
        "email": user.email,
        "phone": user.phone,
      },
    );
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      String id = jsonDecode(response.bodyString.toString())['name'];
      user.id = id;
    }
    return user;
  }

  Future<User> updateUser(User user) async {
    final response = await put(
      "${url}user_aan/${user.id}.json",
      {
        "name": user.name,
        "email": user.email,
        "phone": user.phone,
      },
    );
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      String id = jsonDecode(response.bodyString.toString())['name'];
      user.id = id;
    }
    return user;
  }

  Future<Response> deleteUser(String id) async {
    final response = await delete("${url}user_aan/${id}.json");
    print('response: ${response.bodyString}');
    return response;
  }
}
