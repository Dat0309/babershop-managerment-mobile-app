// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:babershop_managerment/models/ExtracostModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/extracost_repo.dart';

class ExtracostController extends GetxController {
  final ExtracostRepo extracostRepo;
  ExtracostController({
    required this.extracostRepo,
  });

  List<dynamic> extracosts = [];
  List<dynamic> baberExtracostsByAdmin = [];
  List<dynamic> staffExtracostsByAdmin = [];
  List<dynamic> baberExtracostsByStaff = [];
  List<dynamic> staffExtracostsByStaff = [];

  Extracost? extracost;

  bool isLoadedExtracosts = false;
  bool adminLoadedBaberExtracost = false;
  bool adminLoadedStaffExtracost = false;
  bool staffLoadedBaberExtracost = false;
  bool staffLoadedAllBaberExtracost = false;
  bool staffLoadedExtracost = false;
  bool isCreated = false;

  Future<void> adminGetAllExtracostOfBabershop(String id) async {
    adminLoadedBaberExtracost = false;
    await extracostRepo.adminGetBabershopExtracost(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['extracost'].length > 0) {
          baberExtracostsByAdmin.clear();
          for (int i = 0; i < resData['extracost'].length; i++) {
            if (resData['extracost'][i] != null) {
              Map<String, dynamic> map = resData['extracost'][i];
              baberExtracostsByAdmin.add(Extracost.fromMap(map));
            }
          }
          adminLoadedBaberExtracost = true;
          update();
        }
      }
    });
  }

  Future<void> staffGetAllExtracostIOfThem() async {
    staffLoadedExtracost = false;
    await extracostRepo.staffGetAllExtracosts().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['extracost'].length > 0) {
          staffExtracostsByStaff.clear();
          for (int i = 0; i < resData['extracost'].length; i++) {
            if (resData['extracost'][i] != null) {
              Map<String, dynamic> map = resData['extracost'][i];
              staffExtracostsByStaff.add(Extracost.fromMap(map));
            }
          }
          staffLoadedExtracost = true;
          update();
        }
      }
    });
  }

  Future<void> staffGetExtracostsOfBabershop() async {
    staffLoadedBaberExtracost = false;
    await extracostRepo.staffGetBabershopExtracosts().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['extracost'].length > 0) {
          baberExtracostsByStaff.clear();
          for (int i = 0; i < resData['extracost'].length; i++) {
            if (resData['extracost'][i] != null) {
              Map<String, dynamic> map = resData['extracost'][i];
              baberExtracostsByStaff.add(Extracost.fromMap(map));
            }
          }
          staffLoadedBaberExtracost = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<Map<String, dynamic>> createExtracost(String title, int price) async {
    var result;

    await extracostRepo.createExrtracost(title, price).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Extracost extracost = Extracost.fromMap(resData['createExtracost']);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'extracost': extracost,
        };
        update();
      } else {
        result = {
          'status': false,
          'code': value.statusCode,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }
}
