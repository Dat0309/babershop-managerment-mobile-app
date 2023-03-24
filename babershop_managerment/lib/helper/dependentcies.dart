// ignore_for_file: unused_local_variable

import 'package:babershop_managerment/controller/auth_controller.dart';
import 'package:babershop_managerment/controller/babershop_controller.dart';
import 'package:babershop_managerment/controller/booking_controller.dart';
import 'package:babershop_managerment/controller/extracost_controller.dart';
import 'package:babershop_managerment/controller/hairstyle_controller.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/services/reposiitory/auth_repo.dart';
import 'package:babershop_managerment/services/reposiitory/babershop_repo.dart';
import 'package:babershop_managerment/services/reposiitory/booking_repo.dart';
import 'package:babershop_managerment/services/reposiitory/extracost_repo.dart';
import 'package:babershop_managerment/services/reposiitory/hairstyle_repo.dart';
import 'package:babershop_managerment/services/reposiitory/order_repo.dart';
import 'package:babershop_managerment/services/reposiitory/services_repo.dart';
import 'package:babershop_managerment/services/reposiitory/user_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependentcies {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ServicesRepo());
    Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => BabershopRepo());
    Get.lazyPut(() => BookingRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => HairStyleRepo());
    Get.lazyPut(() => OrderRepo());
    Get.lazyPut(() => UserRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => ExtracostRepo());

    Get.lazyPut(() => ServiceController(servicesRepo: Get.find()));
    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => BabershopController(babershopRepo: Get.find()));
    Get.lazyPut(() => BookingController(bookingRepo: Get.find()));
    Get.lazyPut(() => HairStyleController(hairStyleRepo: Get.find()));
    Get.lazyPut(() => OrderController(orderRepo: Get.find()));
    Get.lazyPut(() => UserController(userRepo: Get.find()));
    Get.lazyPut(() => ExtracostController(extracostRepo: Get.find()));
  }
}
