// ignore_for_file: deprecated_member_use

import 'package:babershop_managerment/constant/app_constant.dart';
import 'package:babershop_managerment/models/AuthModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(AuthModel auth) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('_id', auth.id!);
    sharedPreferences.setString('babershop_id', auth.babershopId!);
    sharedPreferences.setString('role', auth.role!);
    sharedPreferences.setString('token', auth.token!);
    sharedPreferences.setString('full_name', auth.fullName!);
    sharedPreferences.setString('createdAt', auth.createAt!);
    sharedPreferences.setInt('salary', auth.salary!);
    sharedPreferences.setInt("temp_salary", 0);

    return sharedPreferences.commit();
  }

  Future<AuthModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? id = sharedPreferences.getString("_id");
    String? babershopId = sharedPreferences.getString("babershop_id");
    String? fullName = sharedPreferences.getString("full_name");
    String? role = sharedPreferences.getString("role");
    String? createAt = sharedPreferences.getString("createAt");
    String? token = sharedPreferences.getString("token");
    int? salary = sharedPreferences.getInt("salary");

    return AuthModel(
      id: id,
      babershopId: babershopId,
      fullName: fullName,
      role: role,
      salary: salary,
      createAt: createAt,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("id");
    sharedPreferences.remove("babershop_id");
    sharedPreferences.remove("full_name");
    sharedPreferences.remove("role");
    sharedPreferences.remove('salary');
    sharedPreferences.remove("createAt");
    sharedPreferences.remove("token");
    sharedPreferences.remove("temp_salary");
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

  Future<int> getTempSalary() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    int result = 0;
    if (sharedPreferences.containsKey("temp_salary")) {
      result = sharedPreferences.getInt("temp_salary")!;
    } else {}
    return result;
  }

  Future<bool> setTempSalary(int salary) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setInt("temp_salary", salary);
    return sharedPreferences.commit();
  }
}
