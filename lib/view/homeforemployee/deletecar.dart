import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:car_x/view/home/getallmycar.dart';
import 'package:car_x/view/home/getallusercars.dart';
import 'package:car_x/view/rent/forsell.dart';
import 'package:car_x/view/rent/sold.dart';
import 'package:car_x/view/sell/forsell.dart';
import 'package:car_x/view/sell/sold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class deletecar extends GetxController {
  getallcarcontroller controller1 = Get.put(
    getallcarcontroller(),
  );
  getallmycarcontroller controller = Get.put(
    getallmycarcontroller(),
  );
  getallsellcarcontroller controller2 = Get.put(
    getallsellcarcontroller(),
  );
  getallsoldcarcontroller controller3 = Get.put(
    getallsoldcarcontroller(),
  );
  getallrentcarcontroller controller4 = Get.put(
    getallrentcarcontroller(),
  );
  getallrentedcarcontroller controller5 = Get.put(
    getallrentedcarcontroller(),
  );
  deletecarconn() async {
    var ids = controller1.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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

  deletemycarconn() async {
    var ids = controller.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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

  deletecarsellconn() async {
    var ids = controller2.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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

  deletecarsoldconn() async {
    var ids = controller3.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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

  deletecarrentconn() async {
    var ids = controller4.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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

  deletecarrentedconn() async {
    var ids = controller5.id;

    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/delete/${ids}');
    var response = await http.delete(
      uri,
    );
    if (kDebugMode) debugPrint(response.body);
    if (response.statusCode == 200) {
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
}
