import 'package:babershop_managerment/constant/app_url.dart';
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
}
