import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../login_request_model.dart';
import '../login_respons_model.dart';
import '../constans_app.dart';
import '../http/get_connect_api.dart';

class LoginRequestProvider extends GetConnect {
  String url = ConstansApp.BASE_URL;

  @override
  void onInit() {
    // httpClient.baseUrl = ConstansApp.BASE_URL; //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);
    super.onInit();
  }

  Future<LoginRespons> postLogin(LoginRequest request) async {
    print(request.toJson().toString());
    final response = await post(
      "${url}method/login",
      request.toJson(),
      headers: {
        HttpHeaders.hostHeader: "172.104.44.22",
      },
    );
    if (response.headers == null ||
        !response.headers!.containsKey(HttpHeaders.setCookieHeader)) {
      var setCookie = response.headers![HttpHeaders.setCookieHeader];
      print("Cookie = ${setCookie.toString()}");
    }

    print('response: ${response.bodyString}');
    LoginRespons responsex = LoginRespons();
    if (response != null && response.bodyString != null) {
      try {
        responsex =
            LoginRespons.fromJson(jsonDecode(response.bodyString.toString()));
      } on Exception catch (_) {
        print('Error ${_}');
      }
    }
    return responsex;
  }
}
