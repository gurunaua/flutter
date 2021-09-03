import 'dart:convert';

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
    );
    print('response: ${response.bodyString}');
    LoginRespons responsex = LoginRespons();
    if (response != null && response.bodyString != null) {
      responsex =
          LoginRespons.fromJson(jsonDecode(response.bodyString.toString()));
    }
    return responsex;
  }
}
