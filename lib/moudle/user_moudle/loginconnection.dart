import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:car_x/control/user_controller/logincontroller.dart';

import 'package:car_x/moudle/user_moudle/token.dart';
import 'package:car_x/view/cars/addcar/addcarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

var data;
Future<void> loginco() async {
  addcarcontrol controller1 = Get.put(
    addcarcontrol(),
  );
  Userlogincontroler controller =
      Get.put(Userlogincontroler(), permanent: true);

  var url = Uri.parse('${ApiConfig.baseUrl}/api/login');

  var response = await http.post(url, body: {
    'mobile': controller.phonenumber,
    'password': controller.password
  });
  var status = response.statusCode;
  data = jsonDecode(response.body);
  if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
  if (kDebugMode) debugPrint('Response body: ${response.body}');

  if (status == 200) {
    savetoken(data["access_token"]);
    saveper(data["Permission"]);
    var per;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    per = prefs.getString("per");

    if (per == "Customer") {
      savetoken(data["access_token"]);
      Get.toNamed("/dashbord");
    } else if (per == "Admin") {
      Get.toNamed("/admindashbord");
    } else if (per == "Company Director") {
      saveemployeetoken(data["access_token"]);
      Get.toNamed("/manegerdashbord");
    } else if (per == "Employee") {
      savecaremployeetoken(data["access_token"]);
      Get.toNamed("/employeedashbord");
    } else if (per == "Salesman") {
      savecarpartemployeetoken(data["access_token"]);
      Get.toNamed("/salemandashbord");
    } else if (per == "Workshop Owner") {
      saveworkshoptoken(data["access_token"]);
      Get.toNamed("/workdashbord");
    }
  } else if (response.body.contains("error")) {
    Get.rawSnackbar(
      title: 'تأكد من رقم الهاتف او كلمة المرور',
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white38,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
