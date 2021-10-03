import 'package:daftar_kontak_flutter/app/data/kontak_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Kontak> checkBoxListTileModel = RxList<Kontak>();
  RxBool isDeleteActive = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkBoxListTileModel.value.add(Kontak(
        id: 1,
        email: "email1",
        nama: "nama",
        noHp: "11111111",
        isCheck: false));
    checkBoxListTileModel.value.add(Kontak(
        id: 2,
        email: "email2",
        nama: "nama",
        noHp: "222222222",
        isCheck: false));
    checkBoxListTileModel.value.add(Kontak(
        id: 3, email: "email3", nama: "nama", noHp: "333333", isCheck: false));
    checkBoxListTileModel.value.add(Kontak(
        id: 4,
        email: "email4",
        nama: "nama",
        noHp: "44444444",
        isCheck: false));
  }

  changeCheck(int id) {
    if (!checkBoxListTileModel.isEmpty) {
      checkBoxListTileModel.value.forEach((element) {
        if (element.id == id) element.isCheck = !element.isCheck!;
      });
    }
    bool isCheked = false;
    checkBoxListTileModel.value.forEach((element) {
      if (element.isCheck!) isCheked = true;
    });
    isDeleteActive.value = isCheked;
  }
}
