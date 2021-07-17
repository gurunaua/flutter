import 'package:get/get.dart';

import 'package:test_get_x/app/modules/add/bindings/add_binding.dart';
import 'package:test_get_x/app/modules/add/views/add_view.dart';
import 'package:test_get_x/app/modules/home/bindings/home_binding.dart';
import 'package:test_get_x/app/modules/home/views/home_view.dart';
import 'package:test_get_x/app/modules/profile/bindings/profile_binding.dart';
import 'package:test_get_x/app/modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
