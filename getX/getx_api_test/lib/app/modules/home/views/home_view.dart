import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/home_controller.dart';
import '../../../util/convert.dart';

class HomeView extends GetView<HomeController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: Obx(() {
        return LoadingOverlay(
          isLoading: controller.isLoading.value,
          child: ListView(
            children: controller.data.value.data!
                .map((data) => ListTile(
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 100,
                          minHeight: 100,
                          maxWidth: 150,
                          maxHeight: 120,
                        ),
                        child: imageFromBase64String(data!.image ?? null),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${data.itemName ?? "no name"}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "no name bla bla\n bla bla",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            "${data.normalRate ?? "00"}",
                            style: TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "${data.promoRate ?? "00"}",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () => {
                        Get.defaultDialog(
                            title: "${data.itemName ?? "no name"}",
                            middleText: "no name bla bla\n bla bla bla",
                            backgroundColor: Colors.blue,
                            titleStyle: TextStyle(color: Colors.white),
                            middleTextStyle: TextStyle(color: Colors.white),
                            textConfirm: "Beli",
                            textCancel: "Batal",
                            cancelTextColor: Colors.white,
                            confirmTextColor: Colors.white,
                            buttonColor: Colors.red,
                            barrierDismissible: false,
                            radius: 50,
                            content: Column(
                              children: [
                                Container(
                                    child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 100,
                                    minHeight: 100,
                                    maxWidth: 150,
                                    maxHeight: 120,
                                  ),
                                  child: imageFromBase64String2(
                                      data!.image ?? null),
                                )),
                                Container(
                                    child: Text(
                                        "no name bla bla\n bla bla bla bla bla bla")),
                                Container(
                                    child:
                                        Text("Rp ${data.promoRate ?? "00"}")),
                              ],
                            ))
                      },
                    ))
                .toList(),
          ),
        );
      }),
    );
  }
}
