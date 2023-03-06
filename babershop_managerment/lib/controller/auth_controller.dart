// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:babershop_managerment/models/AuthModel.dart';
import 'package:babershop_managerment/models/User.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:babershop_managerment/services/reposiitory/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool isLogged = false;
  bool userLogged = false;
  bool isRegistated = false;

  Future logout() async {
    await authRepo.logout();
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;
    await authRepo.login(username, password).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);
        AuthModel authUser = AuthModel.fromMap(res);
        UserPreference().saveUser(authUser);
        authRepo.saveUserToken(authUser.token!);
        isLogged = true;

        result = {
          'status': true,
          'message': 'Successful',
          'user': authUser,
        };
        update();
      } else {
        result = {
          'status': false,
          'message': 'error',
        };
        update();
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> register(User user) async {
    var result;
    await authRepo.register(user).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> res = json.decode(value.body);
        User userResgister = User.fromMap(res);
        isRegistated = true;
        result = {
          'status': true,
          'message': 'Successful',
          'user': userResgister,
        };
        update();
      } else {
        result = {
          'status_code': value.statusCode,
          'status': false,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }

  void saveUsernameAndPassword(String username, String password) {
    authRepo.saveUsernameAndPassword(username, password);
  }

  void checkUserLogged() {
    UserPreference().getUser().then((value) {
      if (value.token != null) {
        userLogged = true;
        update();
      } else {
        userLogged = false;
        update();
      }
    });
    update();
  }
}
