import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_get_x/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All user")),
        actions: [
          IconButton(
            onPressed: () {
              print('refresh');
              controller.loadUsers();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              print('ADD');
              Get.toNamed(Routes.ADD);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  // return Text("kosonng ${controller.users[0].name}");
                  return ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://ichef.bbci.co.uk/news/976/cpsprodpb/0316/production/_91509700_saya2016ver_telyuka_2016-09-09.png",
                        ),
                      ),
                      subtitle: Text("${controller.users[i].email}"),
                      title: Text("${controller.users[i].name.toString()}"),
                      trailing: IconButton(
                        onPressed: () {
                          if (controller.users[i] != null) {
                            controller
                                .delete(controller.users[i].id.toString());
                          }
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(
                          Routes.PROFILE,
                          arguments: controller.users[i].id.toString(),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
