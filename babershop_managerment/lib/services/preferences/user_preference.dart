// ignore_for_file: deprecated_member_use

import 'package:babershop_managerment/constant/app_constant.dart';
import 'package:babershop_managerment/models/AuthModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(AuthModel auth) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('id', auth.id!);
    sharedPreferences.setString('role', auth.role!);
    sharedPreferences.setString('token', auth.token!);
    sharedPreferences.setString('full_name', auth.fullName!);
    sharedPreferences.setString('createAt', auth.createAt!);

    return sharedPreferences.commit();
  }

  Future<AuthModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? id = sharedPreferences.getString("id");
    String? fullName = sharedPreferences.getString("full_name");
    String? role = sharedPreferences.getString("role");
    String? createAt = sharedPreferences.getString("createAt");
    String? token = sharedPreferences.getString("token");

    return AuthModel(
      id: id,
      fullName: fullName,
      role: role,
      createAt: createAt,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("id");
    sharedPreferences.remove("full_name");
    sharedPreferences.remove("role");
    sharedPreferences.remove("createAt");
    sharedPreferences.remove("token");
  }

  Future<String> getToken() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    String result = "";
    if (sharedPreference.containsKey(AppConstant.TOKEN)) {
      result = sharedPreference.getString(AppConstant.TOKEN)!;
    }
    return result;
  }
}
