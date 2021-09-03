import 'dart:convert';

import 'package:get/get.dart';
import '../list_respons_model.dart';
import '../constans_app.dart';

class ListProvider extends GetConnect {
  @override
  void onInit() {
    // add your local storage here to load for every request
    // var token = LocalStorage.readToken();    //1.base_url
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

    super.onInit();
  }

  Future<Data> getList() async {
    var response = await get(
        '${ConstansApp.BASE_URL}/api/resource/Item?fields=["item_code", "item_name","image","normal_rate","promo_rate"]&filters=[["Item","item_group","=","Products"]]');
    print('response: ${response.bodyString}');
    Data responsex = Data();
    if (response != null && response.bodyString != null) {
      responsex = Data.fromJson(jsonDecode(response.bodyString.toString()));
    }
    return responsex;
  }
}
