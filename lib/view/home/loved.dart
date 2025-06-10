import 'package:car_x/view/home/getallusercars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Future loved() async {
  getallcarusercontroller controller = Get.put(
    getallcarusercontroller(),
  );
  var token = controller.token;
  var ids = controller.loveid;
  var url = Uri.parse('http://10.0.2.2:8000/api/User/Car/LoveCar/$ids');
  var response = await http.post(
    url,
    headers: {"Authorization": "Bearer $token"},
  );

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
