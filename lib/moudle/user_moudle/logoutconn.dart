import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class logoutcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    super.onInit();
  }

  erase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    erasetoken = prefs.clear();
  }

  var erasetoken;
  var token;

  logoutco() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/logout');
    var response =
        await http.post(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    var data = response.body;
    if (status == 200) {
      Get.offAllNamed("signup");

      if (kDebugMode) debugPrint(data);
    }
  }
}
