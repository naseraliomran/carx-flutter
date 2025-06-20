import 'package:car_x/control/user_controller/singupcontroller.dart';
import 'package:car_x/config/api_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> singupco() async {
  Usersignupcontroler controller = Get.put(
    Usersignupcontroler(),
  );
  var url = Uri.parse('${ApiConfig.baseUrl}/api/register');
  var response = await http.post(url, body: {
    'name': controller.username,
    'mobile': controller.phonenumber,
    'age': controller.age,
    'jop': controller.jop,
    'gender': controller.gender,
    'password': controller.password
  });

  var status = response.statusCode;
  if (kDebugMode) {
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
  }
  if (response.body.contains("Authenticate")) {
    Get.rawSnackbar(
      title: 'فشل التسجيل',
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.BOTTOM,
    );
  } else if (status == 200) {
    Get.toNamed("/login");
  }
}
