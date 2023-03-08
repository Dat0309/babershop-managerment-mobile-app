// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:babershop_managerment/constant/app_constant.dart';
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];

  void addToCartList(List<Cart> carts) {
    sharedPreferences.remove(AppConstant.CART);
    cart.clear();

    for (var element in carts) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstant.CART, cart);
    getCartList();
  }

  List<Cart> getCartList() {
    List<String> cartList = [];
    if (sharedPreferences.containsKey(AppConstant.CART)) {
      cartList = sharedPreferences.getStringList(AppConstant.CART)!;
    }
    List<Cart> carts = [];

    for (var element in cartList) {
      carts.add(Cart.fromJson(jsonDecode(element)));
    }

    return carts;
  }

  void clearCartStorage() {
    cart.clear();
    sharedPreferences.remove(AppConstant.CART);
  }
}
