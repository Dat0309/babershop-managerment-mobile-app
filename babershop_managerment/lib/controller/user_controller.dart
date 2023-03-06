import 'dart:convert';

import 'package:babershop_managerment/models/ProfileModel.dart';
import 'package:babershop_managerment/services/reposiitory/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;

  late Profile? profile;

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
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
}
