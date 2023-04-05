// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:babershop_managerment/models/HairStyleModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/hairstyle_repo.dart';

class HairStyleController extends GetxController {
  final HairStyleRepo hairStyleRepo;
  HairStyleController({
    required this.hairStyleRepo,
  });

  List<dynamic> hairstyles = [];
  List<dynamic> limitHairstyle = [];

  bool isLoadedLimit = false;
  bool isLoaded = false;

  Future<void> getLimitHairstyle() async {
    isLoadedLimit = false;
    await hairStyleRepo.getHairstyles().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['hairstyle'].length > 0) {
          limitHairstyle.clear();
          for (int i = 0; i < resData['hairstyle'].length; i++) {
            if (resData['hairstyle'][i] != null) {
              Map<String, dynamic> map = resData['hairstyle'][i];
              limitHairstyle.add(HairStyle.fromMap(map));
            }
          }
          isLoadedLimit = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> getHairstyle() async {
    isLoaded = false;
    await hairStyleRepo.getAllHairstyles().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['hairstyle'].length > 0) {
          hairstyles.clear();
          for (int i = 0; i < resData['hairstyle'].length; i++) {
            if (resData['hairstyle'][i] != null) {
              Map<String, dynamic> map = resData['hairstyle'][i];
              hairstyles.add(HairStyle.fromMap(map));
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
