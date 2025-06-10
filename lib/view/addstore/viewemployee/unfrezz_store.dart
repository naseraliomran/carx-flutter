import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addstore/viewemployee/viewstorescontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

viewestorecontroller controller = Get.put(
  viewestorecontroller(),
);
var ids = controller.id;
Future<void> unfrezzstoreconn() async {
  var url = Uri.parse('${ApiConfig.baseUrl}/api/Store/unfreeze/$ids');
  var response = await http.post(
    url,
  );

  var status = response.statusCode;
  if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
  if (kDebugMode) debugPrint('Response body: ${response.body}');
  if (status == 200) {
    Get.rawSnackbar(
      barBlur: 2,
      titleText: Text(
        "تم الغاء تجميد المخزن  بنجاح",
        style: TextStyle(
            color: Color(0xFF020202),
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
