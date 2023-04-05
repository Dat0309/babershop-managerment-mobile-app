import 'dart:convert';

import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ExtracostRepo extends GetxService {
  ExtracostRepo();

  String token = "";

  Future<http.Response> createExrtracost(String title, int price) async {
    token = await UserPreference().getToken();
    final Map<String, dynamic> extracosts = {
      'title': title,
      'price': price,
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.EXTRACOST),
      body: json.encode(extracosts),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> adminGetAllExtracost() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_GET_ALL_EXTRACOSTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> staffGetAllExtracosts() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.STAFF_GET_ALL_EXTRACOSTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> staffGetBabershopExtracosts() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.STAFF_GET_BABERSHOP_EXTRACOSTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminGetBabershopExtracost(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.ADMIN_GET_BABERSHOP_EXTRACOSTS}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getExtracostById(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse("${AppUrl.EXTRACOST}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
