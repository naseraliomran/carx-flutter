import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:car_x/view/addstore/viewemployee/viewstorescontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Future<void> deletstoreconn() async {
  viewestorecontroller controller = Get.put(
    viewestorecontroller(),
  );
  var token = controller.token;
  var ids = controller.id;
  var url = Uri.parse('${ApiConfig.baseUrl}/api/Store/deleteStore/$ids');
  var response = await http.delete(
    url,
    headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
  );

  var status = response.statusCode;
  if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
  if (kDebugMode) debugPrint('Response body: ${response.body}');
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
