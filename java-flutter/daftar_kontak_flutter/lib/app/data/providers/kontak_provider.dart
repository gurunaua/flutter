import 'package:daftar_kontak_flutter/app/data/kontak_model.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class KontakProvider extends GetConnect {
  // Future<Kontak> getList() async {
  //   var response = await get('http://localhost:8080/kontaks');
  //   print('response: ${response.bodyString}');
  //
  //   return responsex;
  // }
  //
  // @override
  // void onInit() {
  //   httpClient.baseUrl = ""; //2.
  //   httpClient.defaultContentType = "application/json";
  //   httpClient.timeout = Duration(seconds: 20);
  // }
  //
  // Future<Kontak> postLogin(LoginRequest request) async {
  //   print(request.toJson().toString());
  //   final response = await post(
  //     "${url}method/login",
  //     request.toJson(),
  //     headers: {
  //       HttpHeaders.hostHeader: "172.104.44.22",
  //     },
  //   );
  //   if (response.headers == null ||
  //       !response.headers!.containsKey(HttpHeaders.setCookieHeader)) {
  //     var setCookie = response.headers![HttpHeaders.setCookieHeader];
  //     print("Cookie = ${setCookie.toString()}");
  //   }
  //
  //   print('response: ${response.bodyString}');
  //   LoginRespons responsex = LoginRespons();
  //   if (response != null && response.bodyString != null) {
  //     try {
  //       responsex =
  //           LoginRespons.fromJson(jsonDecode(response.bodyString.toString()));
  //     } on Exception catch (_) {
  //       print('Error ${_}');
  //     }
  //   }
  //   return responsex;
  // }
}
