import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BabershopRepo extends GetxService {
  BabershopRepo();

  var token = '';
  Future<http.Response> getBabershops() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.BABERSHOP),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> adminGetAllBabershop() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_GET_ALL_BABERSHOP),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
