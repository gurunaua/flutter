import 'package:get/get.dart';

import '../constans_app.dart';

class GetConnectApi extends GetConnect {
  String url = "";

  void init() {
    // add your local storage here to load for every request
    // var token = LocalStorage.readToken();    //1.base_url
    url = ConstansApp.BASE_URL;
    httpClient.baseUrl = ConstansApp.BASE_URL; //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);
    // httpClient.addResponseModifier((request, response) async {
    //   print(response.body);
    // });
    // httpClient.addRequestModifier((request) async {
    //   // add request here
    //   return request;
    // });
    // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator((request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });
  }
}
