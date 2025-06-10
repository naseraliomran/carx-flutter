import 'package:car_x/control/worksope/workshope_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> addworkeshopconn() async {
  workashopcontrol controller = Get.put(
    workashopcontrol(),
  );
  var rate = 0;
  var url = Uri.parse('http://10.0.2.2:8000/api/Workshop/save');
  var response = await http.post(url, body: {
    'nameWorkshop': controller.name_ar,
    'phone': controller.phone,
    'address': controller.address,
    'workingTimeFrom': '${controller.timefrom}:00:00',
    'workingTimeTo': '${controller.timeto}:00:00',
    'address_longitude': controller.long.toString(),
    'address_latitude': controller.lat.toString(),
    'name': controller.username,
    'mobile': controller.phonenumber,
    'password': controller.password,
    'gender': controller.gender,
    'age': controller.age,
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (status == 200) {
    Get.rawSnackbar(
      barBlur: 2,
      titleText: Text(
        "تمت العملية بنجاح",
        style: TextStyle(
            color: Color(0xFF164f92),
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
