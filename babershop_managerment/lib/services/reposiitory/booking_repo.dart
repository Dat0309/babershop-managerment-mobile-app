import 'dart:convert';

import 'package:babershop_managerment/constant/app_constant.dart';
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  BookingRepo({required this.sharedPreferences});

  List<String> booking = [];

  void addToBookingList(List<Cart> bookings) {
    sharedPreferences.remove(AppConstant.CART);
    bookings.clear();

    for (var element in bookings) {
      booking.add(jsonEncode(element));
    }
    sharedPreferences.setStringList(AppConstant.CART, booking);
    getBookingList();
  }

  List<Cart> getBookingList() {
    List<String> bookingList = [];
    if (sharedPreferences.containsKey(AppConstant.CART)) {
      bookingList = sharedPreferences.getStringList(AppConstant.CART)!;
    }
    List<Cart> bookings = [];
    for (var element in bookingList) {
      bookings.add(Cart.fromJson(jsonDecode(element)));
    }
    return bookings;
  }

  void clearBookingStorage() {
    booking.clear();
    sharedPreferences.remove(AppConstant.CART);
  }
}
