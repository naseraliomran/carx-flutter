import 'package:car_x/control/user_controller/singupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> singupco() async {
  Usersignupcontroler controller = Get.put(
    Usersignupcontroler(),
  );
  var url = Uri.parse('http://10.0.2.2:8000/api/register');
  var response = await http.post(url, body: {
    'name': controller.username,
    'mobile': controller.phonenumber,
    'age': controller.age,
    'jop': controller.jop,
    'gender': controller.gender,
    'password': controller.password
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (response.body.contains("Authenticate")) {
    Get.rawSnackbar(
      messageText: LottieBuilder.asset(
        "assets/images/94303-failed.json",
        width: 130,
        height: 130,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  } else if (status == 200) {
    Get.toNamed("/login");
  }
}
