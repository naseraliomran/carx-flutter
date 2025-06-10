import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';

import 'package:car_x/view/cars/addcar/addcarcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class updatecarcontroller extends GetxController {
  addcarcontrol controller1 = Get.put(
    addcarcontrol(),
  );

  String name = "";
  String describe = "";
  var manufacturingYear;
  var price;
  String color = "";
  String city = "";
  var mileage;
  var motionVector;
  var engineCapacity;

  String model = "";
  var id;
  final GlobalKey<FormState> keycarupdate = GlobalKey<FormState>();
  checkaddcarupdate() {
    final isvalid = keycarupdate.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keycarupdate.currentState!.save();
  }

  Future<void> updatecarconn() async {
    var token = controller1.token.toString();
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Car/update/$id');
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      'name': name,
      'describe': describe,
      'manufacturingYear': manufacturingYear.toString(),
      'price': price.toString(),
      'color': color,
      'city': city,
      'mileage': mileage.toString(),
      'motionVector': motionVector.toString(),
      'engineCapacity': engineCapacity.toString(),
      'model': model,
    });

    var status = response.statusCode;
    if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
    if (kDebugMode) debugPrint('Response body: ${response.body}');
    var data = json.decode(response.body);

    if (status == 200) {
      ;
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
}
