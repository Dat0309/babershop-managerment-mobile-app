import 'package:babershop_managerment/constant/app_url.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HairStyleRepo extends GetxService {
  HairStyleRepo();

  var token = '';
  Future<http.Response> getHairstyles() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.HAIRSTYLE),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAllHairstyles() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_ALL_HAIR_STYLE),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
