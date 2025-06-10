import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addsaleman/viewsaleman/viewsalemancontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Future<void> deletesaleconn() async {
  viewesaleecontroller controller = Get.put(
    viewesaleecontroller(),
  );
  var token = controller.token;
  var ids = controller.id;
  var url = Uri.parse('${ApiConfig.baseUrl}/api/Salesman/deleteSalesMan/$ids');
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
            color: Color(0xFF0A0A0A),
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
