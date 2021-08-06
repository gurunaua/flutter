import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  var url =
      "https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555389964/shape/mentalfloss/istock_000020431781_small.jpg";

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    new Positioned(
                      top: 20.0,
                      right: 0.0,
                      child: new Text(
                        "99",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Text(
                      "Name User",
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    Text(
                      "last login: 01:01:2021",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Wishlist',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Cart',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                )
              ],
              controller: controller.pageController,
            ),
          ),
        ],
      ),
      // body: SizedBox.expand(
      //   child: PageView(
      //     physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      //     children: [
      //       Container(
      //         child: Center(
      //           child: Text(
      //             'Home',
      //             style: TextStyle(fontSize: 30),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: Center(
      //           child: Text(
      //             'Wishlist',
      //             style: TextStyle(fontSize: 30),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: Center(
      //           child: Text(
      //             'Cart',
      //             style: TextStyle(fontSize: 30),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: Center(
      //           child: Text(
      //             'Profile',
      //             style: TextStyle(fontSize: 30),
      //           ),
      //         ),
      //       )
      //     ],
      //     controller: controller.pageController,
      //   ),
      // ),
      bottomNavigationBar: Obx(
        () => FancyBottomNavigation(
          tabs: [
            TabData(
              iconData: Icons.home,
              title: 'Home',
            ),
            TabData(
              iconData: Icons.favorite,
              title: 'Wishlist',
            ),
            TabData(
              iconData: Icons.shopping_cart,
              title: 'Cart',
            ),
            TabData(
              iconData: Icons.account_box,
              title: 'Profile',
            ),
          ],
          onTabChangedListener: (position) {
            controller.tabIndex.value = position;
            controller.pageController.jumpToPage(position);
          },
          initialSelection: controller.tabIndex.value,
          key: controller.bottomNavigationKey,
          inactiveIconColor: Colors.grey,
        ),
      ),
    );
  }
}
