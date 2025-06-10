import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:car_x/view/addempl/viewemployee/viewemployee.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class viewemployeecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");

    super.onInit();
  }

  var token;

  String username = "";
  String phonenumber = "";
  String password = "";
  String gender = "";
  String age = "";
  var id;
  List data = [];

  Future<void> getallemployee() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Employee/getAll');

    var response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    var status = response.statusCode;

    data = jsonDecode(response.body);

    if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
    if (kDebugMode) debugPrint('Response body: ${response.body}');

    if (status == 200) {
      Get.to(() => viewemployee());
    } else {}
    update();
  }
}
