import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class deletecarpartimagecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("carpartemptoken");
    super.onInit();
  }

  var token;
  var id;
  deletecarpartimageconn() async {
    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Parts/delete/${id}');
    var response = await http.delete(
      uri,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
      Get.back();
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
      update();
    }
  }
}
