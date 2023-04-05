// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/booking_controller.dart';
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/services_repo.dart';

class ServiceController extends GetxController {
  final ServicesRepo servicesRepo;
  ServiceController({
    required this.servicesRepo,
  });

  List<dynamic> services = [];

  bool isLoaded = false;
  bool isCreated = false;
  bool isUpdated = false;
  bool isDeleted = false;

  BookingController _booking = Get.find<BookingController>();

  double get amount => bookingTotalPrice.toDouble();

  int _quantity = 1;
  int get quantity => _quantity;

  int _inBookingItem = 0;
  int get inBookingItem => _inBookingItem + _quantity;

  bool _itemExist = false;
  bool get itemExist => _itemExist;

  int get bookingTotalItem => _booking.totalItems;
  int get bookingTotalPrice => _booking.totalPrice;

  void initServices(Services services, BookingController cartController) {
    _booking = cartController;
    _quantity = 1;
    _inBookingItem = 1;
    _itemExist = cartController.existInBooking(services);
  }

  Future<void> getServices() async {
    await servicesRepo.getAllServices().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['service'].length > 0) {
          services.clear();
          for (int i = 0; i < resData['service'].length; i++) {
            if (resData['service'][i] != null) {
              Map<String, dynamic> map = resData['service'][i];
              services.add(Services.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<Map<String, dynamic>> createServices(
      String serviceName, int price, double percent) async {
    var result;
    await servicesRepo
        .createServices(serviceName, price, percent)
        .then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> res = json.decode(value.body);
        Services services = Services.fromMap(res);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'services': services,
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

  Future<Map<String, dynamic>> updateServices(Services servicesModel) async {
    var result;
    await servicesRepo.updateServices(servicesModel).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);
        Services services = Services.fromMap(res);
        isUpdated = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'services': services,
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

  Future<Map<String, dynamic>> deleteServices(String id) async {
    var result;
    await servicesRepo.deleteServices(id).then((value) {
      if (value.statusCode == 200) {
        isDeleted = true;

        result = {
          'status': true,
          'message': 'Successfull',
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

  void addBookingItem(Services product, int qty) {
    if (qty > 0) {
      _booking.addItem(product, qty);
    } else {
      Get.snackbar(
        'Lỗi',
        'Xin hãy chọn số lượng dịch vụ được sử dụng!',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
    }
    update();
  }

  void removeBookingItem(Services service) {
    if (_booking.existInBooking(service)) {
      _booking.removeItem(service);
    }
    update();
  }

  List<Cart> get getBookingItems {
    return _booking.getItems;
  }

  List<Cart> get getBookingItemsStorage {
    return _booking.getBookingData();
  }

  Map<String, dynamic> get getItemJson {
    return _booking.items;
  }

  void updateBookingQty(String id, int qty) {
    _booking.updateItemQty(id, qty);
    update();
  }

  void clearBooking() {
    _booking.clearBooking();
  }
}
