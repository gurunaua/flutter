import 'package:daftar_kontak_flutter/app/data/kontak_model.dart';
import 'package:daftar_kontak_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    List<Kontak> checkBoxListTileModel = controller.checkBoxListTileModel.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kontak'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Obx(() {
              return Icon(Icons.delete,
                  color: controller.isDeleteActive.value
                      ? Colors.white
                      : Colors.grey);
            }),
            onPressed: () {},
          )
        ],
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return LoadingOverlay(
          isLoading: controller.isLoading.value,
          child: ListView.builder(
            itemCount: checkBoxListTileModel.length,
            itemBuilder: (context, index) {
              final item = checkBoxListTileModel[index];
              return Card(
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  title: Column(
                    children: [
                      Text(
                        item.nama!,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(item.noHp!),
                    ],
                  ),
                  trailing: Checkbox(
                    checkColor: Colors.white,
                    value: item.isCheck,
                    onChanged: (bool? value) {
                      controller.changeCheck(item.id!);
                      print('== tap ${item.isCheck} -- v ${value}');
                      controller.update();
                    },
                  ),
                  onTap: () {
                    Get.toNamed(Routes.EDIT);
                  },
                  onLongPress: () {
                    Get.toNamed(Routes.EDIT);
                  },
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
