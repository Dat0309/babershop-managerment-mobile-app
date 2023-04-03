import 'dart:convert';

import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/models/ProfileModel.dart';
import 'package:babershop_managerment/services/reposiitory/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;
  bool isUpdateSalary = false;

  late Profile? profile;

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
        Get.find<OrderController>().adminGetAllOrder();
        Get.find<OrderController>().adminGetAllSalary();
        final Map<String, dynamic> res = json.decode(value.body);

        if (res.isNotEmpty) {
          profile = Profile.fromMap(res);

          isLoadedProfile = true;
          update();
        }
      } else {
        print('user ${value.statusCode}');
      }
    });
  }

  Future<void> updateSalary(int salary) async {
    await userRepo.updateSalary(salary).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res.isNotEmpty) {
          profile = Profile.fromMap(res);

          isUpdateSalary = true;
          update();
        } else {
          print('res is empty');
        }
      } else {
        print('error');
      }
    });
  }
}
