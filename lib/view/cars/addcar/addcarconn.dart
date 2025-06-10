import 'dart:convert';

import 'package:car_x/view/cars/addcar/addcarcontroller.dart';
import 'package:car_x/view/cars/image/uplodecarimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

Future<void> addcarconn() async {
  addcarcontrol controller = Get.put(
    addcarcontrol(),
  );
  uplodimagecontroller controller1 = Get.put(
    uplodimagecontroller(),
  );

  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Car/save');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
    'name': controller.name,
    'describe': controller.describe,
    'manufacturingYear': controller.manufacturingYear.toString(),
    'price': controller.price.toString(),
    'color': controller.color,
    'city': controller.city,
    'mileage': controller.mileage.toString(),
    'motionVector': controller.motionVector.toString(),
    'engineCapacity': controller.engineCapacity.toString(),
    'state': controller.state.toString(),
    'model': controller.model,
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  var data = json.decode(response.body);
  controller1.ids = data["id"];
  if (status == 200) {
    controller1.uplodeimageconn();
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
