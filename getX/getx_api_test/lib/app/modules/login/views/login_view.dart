import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: controller.isLoading.value,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).padding.top,
              color: Colors.blueAccent,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Wellcome !!",
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.start, // has impact
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start, // has impact
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: controller.usernameC,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: controller.passwordC,
                        textInputAction: TextInputAction.done,
                        obscureText: (controller.passwordVisible.value == 1
                            ? true
                            : false),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          suffixIcon: IconButton(
                            onPressed: () => {controller.passwordVisibleView()},
                            icon: Icon(controller.passwordVisible.value == 1
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                        onPressed: () {
                          controller.login();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
