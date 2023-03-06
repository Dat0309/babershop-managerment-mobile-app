// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:convert';

import 'package:babershop_managerment/constant/app_constant.dart';
import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/models/User.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.sharedPreferences,
  });

  var token = UserPreference().getToken();

  Future saveUserToken(String token) async {
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<void> saveUsernameAndPassword(String username, String password) async {
    try {
      await sharedPreferences.setString(AppConstant.USERNAME, username);
      await sharedPreferences.setString(AppConstant.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> login(String username, String password) async {
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    http.Response res = await http.post(
      Uri.parse(AppUrl.LOGIN),
      body: json.encode(loginData),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future logout() async {
    return sharedPreferences.clear();
  }

  Future<http.Response> register(User user) async {
    http.Response res = await http.post(
      Uri.parse(AppUrl.REGISTER),
      body: json.encode(user.toJson()),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  static onError(err) {
    return {
      'status': false,
      'message': 'Unseccessfull Request',
      'data': err,
    };
  }
}
