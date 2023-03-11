// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/cart_controller.dart';
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

  CartController _cart = Get.find<CartController>();

  double get amount => cartTotalPrice.toDouble();

  int _quantity = 1;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  bool _itemExist = false;
  bool get itemExist => _itemExist;

  int get cartTotalItem => _cart.totalItems;
  int get cartTotalPrice => _cart.totalPrice;

  void initServices(Services services, CartController cartController) {
    _cart = cartController;
    _quantity = 1;
    _inCartItem = 1;
    _itemExist = cartController.existInCart(services);
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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQty(_quantity + 1);
    } else {
      _quantity = checkQty(_quantity - 1);
    }
    update();
  }

  int checkQty(int qty) {
    if (qty < 0) {
      return 0;
    } else if (qty > 10) {
      Get.snackbar(
        'Số lượng dịch vụ',
        'Bạn chỉ được sử dụng số lượng tối đa là 10!',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
      return 10;
    }
    return qty;
  }

  void addItem(Services service) {
    if (_quantity > 0) {
      _cart.addItem(service, _quantity);
    } else {
      Get.snackbar(
        'Lỗi',
        'Xin hãy chọn số lượng sản phẩm trước khi thêm vào giỏ hàng!',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
    }
    update();
  }

  void removeItem(Cart cart) {
    _cart.removeItem(cart);
  }

  Map<String, dynamic> get getItemJson {
    return _cart.items;
  }

  void clearCard() {
    _cart.clearCart();
  }
}
