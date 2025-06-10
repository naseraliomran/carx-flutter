import 'package:car_x/control/view_workshop/view_workshope_cont.dart';
import 'package:car_x/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Future<void> deleteworkshopconn() async {
  viewworkshopcontroller controller = Get.put(
    viewworkshopcontroller(),
  );
  var ids = controller.id;
  var url = Uri.parse('http://10.0.2.2:8000/api/Workshop/delete/$ids');
  var response = await http.delete(
    url,
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
  }
}
