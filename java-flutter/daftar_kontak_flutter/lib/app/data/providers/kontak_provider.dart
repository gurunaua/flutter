import 'dart:ffi';

import 'package:daftar_kontak_flutter/app/data/kontak_model.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class KontakProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);
  }

  Future<List<Kontak>> getList() async {
    var response = await get('http://192.168.0.178:8080/kontaks');
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      var responsea = jsonDecode(response.bodyString.toString());
      print('status = ${responsea["status"]}');
      print('status = ${responsea["data"]}');
      if (responsea["status"] == 200 && responsea["data"] != null) {
        List<Kontak> data = List<Kontak>.from(
            responsea["data"].map((model) => Kontak.fromJson(model)));
        return data;
      }
    }
    return List.empty();
  }

  Future<Kontak> postKontak(Kontak kontak) async {
    var response =
        await post('http://192.168.0.178:8080/kontaks', kontak.toJson());
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      var responsea = jsonDecode(response.bodyString.toString());
      print('status = ${responsea["status"]}');
      print('status = ${responsea["data"]}');
      if (responsea["status"] == 200 && responsea["data"] != null) {
        return Kontak.fromJson(responsea["data"]);
      }
    }
    return Kontak(id: 0, nama: "", noHp: "", isCheck: false);
  }

  Future<void> editKontak(Kontak kontak) async {
    var response = await put(
        'http://192.168.0.178:8080/kontaks/${kontak.id}', kontak.toJson());
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      var responsea = jsonDecode(response.bodyString.toString());
      print('status = ${responsea["status"]}');
      print('status = ${responsea["data"]}');
      if (responsea["status"] == 200 && responsea["data"] != null) {
        print("update");
      }
    }
    print("update finish");
  }

  Future<Kontak> getKontak(int id) async {
    var response = await get('http://192.168.0.178:8080/kontaks/${id}');
    print('response: ${response.bodyString}');
    if (response != null && response.bodyString != null) {
      var responsea = jsonDecode(response.bodyString.toString());
      print('status = ${responsea["status"]}');
      print('status = ${responsea["data"]}');
      if (responsea["status"] == 200 && responsea["data"] != null) {
        return Kontak.fromJson(responsea["data"]);
      }
    }
    return Kontak(id: 0, nama: "", noHp: "", isCheck: false);
  }
}
