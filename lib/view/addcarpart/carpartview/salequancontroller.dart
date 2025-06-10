import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addcarpart/addcarpartcontroller.dart';
import 'package:car_x/view/addcarpart/carpartview/viwecarpartconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class saleqcarpartcontrol extends GetxController {
  addcarpartcontrol controller = Get.put(
    addcarpartcontrol(),
  );
  getallcarpartcontroller controller1 = Get.put(
    getallcarpartcontroller(),
  );

  Future<void> salequant() async {
    var token = controller.token;
    var id = controller1.id;
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Parts/Sale/$id');
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      'quantity': controller.saledQuantity.toString()
    });

    var status = response.statusCode;
    if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
    if (kDebugMode) debugPrint('Response body: ${response.body}');
    if (status == 200) {
      update();
      Get.back();
      Get.rawSnackbar(
        barBlur: 2,
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
    } else {}
  }

  final GlobalKey<FormState> saleq = GlobalKey<FormState>();

  checksaleq() {
    final isvalid = saleq.currentState!.validate();
    if (!isvalid) {
      return;
    }
    saleq.currentState!.save();
  }
}
