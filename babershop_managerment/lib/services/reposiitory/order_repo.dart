import 'dart:convert';

import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderRepo extends GetxService {
  OrderRepo();

  String token = "";

  Future<http.Response> createOrder(List<Cart> servicesItems,
      String paymentMethod, int serviceTotalPrice) async {
    token = await UserPreference().getToken();
    var orderItems = json.encode(servicesItems.map((e) => e.toMap()).toList());

    final Map<String, dynamic> orders = {
      'services_items': servicesItems
          .map((e) => e.toMap())
          .toList(), // include find service item in here
      'payment_method': paymentMethod,
      'service_total_price': serviceTotalPrice,
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.ORDER),
      body: json.encode(orders),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> adminGetAllOrders() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_GET_ALL_ORDER),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> staffGetAllOrders() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.STAFF_GET_ALL_ORDER),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getOrders() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ORDER),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> staffGetBabershopOrder() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.STAFF_GET_BABERSHOP_ORDER),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> staffGetAllBabershopOrder() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.STAFF_GET_ALL_BABERSHOP_ORDER),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminGetBabershopOrder(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.ADMIN_GET_BABERSHOP_ORDER}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminGetStaffOrder(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.ADMIN_GET_ORDER_OF_STAFF}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getOrderById(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.ORDER}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAllStaffSalary() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_GET_ALL_SALARY),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminStatistics() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_STATISTICS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminStatisicsById(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.ADMIN_STATISTICS}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
