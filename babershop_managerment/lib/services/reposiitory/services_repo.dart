import 'dart:convert';

import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesRepo extends GetxService {
  ServicesRepo();

  var token = "";
  Future<http.Response> getServices() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.SERVICES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAllServices() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_ALL_SERVICES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> createServices(
      String serviceName, int price, double percent) async {
    String token = await UserPreference().getToken();
    final Map<String, dynamic> services = {
      'name': serviceName,
      'price': price,
      'percent': percent,
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.SERVICES),
      body: json.encode(services),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> updateServices(Services servicesModel) async {
    String token = await UserPreference().getToken();
    final Map<String, dynamic> services = {
      'name': servicesModel.name,
      'price': servicesModel.price,
      'percent': servicesModel.percent,
    };

    http.Response response = await http.put(
      Uri.parse("${AppUrl.SERVICES}/${servicesModel.id}"),
      body: json.encode(services),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> deleteServices(String id) async {
    String token = await UserPreference().getToken();

    http.Response response = await http.delete(
      Uri.parse("${AppUrl.SERVICES}/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
