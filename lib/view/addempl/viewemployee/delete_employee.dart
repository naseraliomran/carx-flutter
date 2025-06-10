import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Future<void> deletemployconn() async {
  viewemployeecontroller controller = Get.put(
    viewemployeecontroller(),
  );
  var token = controller.token;
  var ids = controller.id;
  var url = Uri.parse('http://10.0.2.2:8000/api/Employee/delete/$ids');
  var response = await http.delete(
    url,
    headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
  );

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (status == 200) {
    Get.rawSnackbar(
      barBlur: 2,
      titleText: Text(
        "تمت عملية الحذف بنجاح",
        style: TextStyle(
            color: Color(0xFFFFFFFF),
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
  }
}
