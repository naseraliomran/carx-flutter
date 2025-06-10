import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getallcarpartcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("carpartemptoken");
    super.onInit();
  }

  var id;
  var token;
  List data = [];

  getallcarspaart() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Parts/getAll');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    data = json.decode(response.body);
    if (kDebugMode) debugPrint(data);
    update();
  }
}
