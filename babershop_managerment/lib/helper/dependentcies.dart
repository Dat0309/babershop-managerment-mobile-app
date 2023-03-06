// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependentcies {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
  }
}
