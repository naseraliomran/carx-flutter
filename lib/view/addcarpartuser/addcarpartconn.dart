import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:io';
import 'package:car_x/view/addcarpartuser/addcarpartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

addcarpartusercontrol controller = Get.put(
  addcarpartusercontrol(),
);
var token = controller.token;
uplodeimagepartuserconn() async {
  var uri = Uri.parse('${ApiConfig.baseUrl}/api/User/Parts/save');
  http.MultipartRequest request = http.MultipartRequest('POST', uri);
  var headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'multipart/form-data'
  };
  request.headers.addAll(headers);
  request.fields.addAll({
    'partName': controller.partName.toString(),
    'manufacturingCountry': controller.manufacturingCountry.toString(),
    'partPrice': controller.partPrice.toString(),
    'Quantity': controller.Quantity.toString()
  });
  if (controller.image!.isNotEmpty) {
    for (var i = 0; i < controller.image!.length; i++) {
      request.files.add(http.MultipartFile(
          'imagPart',
          File(controller.image![i].path).readAsBytes().asStream(),
          File(controller.image![i].path).lengthSync(),
          filename: controller.image![i].path.split("/").last));
    }
  }
  var response = await request.send();

  var status = response.statusCode;
  if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
  if (status == 200) {
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
    if (kDebugMode) debugPrint(response.reasonPhrase);
    Get.rawSnackbar(
      titleText: Text(
        "اضف صور للقطعة",
        style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 26,
            fontFamily: 'Cairo-Regular'),
        textAlign: TextAlign.center,
      ),
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
