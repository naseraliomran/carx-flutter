import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getallcarpartusercontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    await getallcarspaartuser();
    super.onInit();
  }

  @override
  void onReady() async {
    await getallcarspaartuser();
    update();
    super.onReady();
  }

  var id;
  var token;
  List data = [];

  getallcarspaartuser() async {
    Future.delayed(Duration(seconds: 2));
    var url = Uri.parse('${ApiConfig.baseUrl}/api/User/Parts/getAll');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    data = json.decode(response.body);
    if (kDebugMode) debugPrint(data);
    update();
  }
}
