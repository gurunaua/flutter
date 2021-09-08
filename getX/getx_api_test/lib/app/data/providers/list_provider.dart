import 'dart:convert';
import 'dart:io';

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

  Future<SomeRootEntity> getList() async {
    var response = await get(
      'http://172.104.44.22/api/resource/Item?fields=["item_code", "item_name","image","normal_rate","promo_rate"]&filters=[["Item","item_group","=","Products"]]',
      headers: {
        HttpHeaders.hostHeader: "172.104.44.22",
        HttpHeaders.cookieHeader:
            "system_user=yes; full_name=Administrator; user_id=Administrator; user_image=; sid=f95d91220415ba5690370e16d528f2003af8075bf6602c7e1e851bde",
      },
    );
    print('response: ${response.bodyString}');

    SomeRootEntity responsex = SomeRootEntity();
    if (response != null && response.bodyString != null) {
      responsex =
          SomeRootEntity.fromJson(jsonDecode(response.bodyString.toString()));
    }
    return responsex;
  }
}
