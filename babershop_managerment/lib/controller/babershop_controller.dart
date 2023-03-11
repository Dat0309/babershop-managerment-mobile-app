// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:babershop_managerment/models/BaberShopModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/babershop_repo.dart';

class BabershopController extends GetxController {
  final BabershopRepo babershopRepo;
  BabershopController({
    required this.babershopRepo,
  });

  List<dynamic> babershops = [];
  bool isLoaded = false;

  Future<void> getBabershop() async {
    await babershopRepo.adminGetAllBabershop().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['babershop'].length > 0) {
          babershops.clear();
          for (int i = 0; i < resData['babershop'].length; i++) {
            if (resData['babershop'][i] != null) {
              Map<String, dynamic> map = resData['babershop'][i];
              babershops.add(BaberShop.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }
}
