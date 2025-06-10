import 'package:car_x/view/addsaleman/addsalemancontroller.dart';
import 'package:car_x/view/addsaleman/viewsaleman/viewsalemancontroler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> addsalemanconn() async {
  addsalemancontroler controller = Get.put(
    addsalemancontroler(),
  );
  viewesaleecontroller controller3 = Get.put(
    viewesaleecontroller(),
  );
  var id = controller3.id;
  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Salesman/setSalesman/$id');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
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
  if (status == 200) {
    Get.rawSnackbar(
      barBlur: 3,
      titleText: Text(
        "تمت العملية بنجاح",
        style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 26,
            fontFamily: 'Cairo-Regular'),
        textAlign: TextAlign.center,
      ),
      messageText: LottieBuilder.asset(
        "assets/images/7184-done.json",
        width: 170,
        height: 170,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  } else if (status == 500) {
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
  }
}
