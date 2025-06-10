import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class deleteimagecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken");

    super.onInit();
  }

  getallcarcontroller controller1 = Get.put(
    getallcarcontroller(),
  );

  var token;

  deleteimageconn() async {
    var ids = controller1.id;
    var imagename = controller1.imagename;
    var uri = Uri.parse('http://10.0.2.2:8000/api/Car/deleteimage/${ids}');
    var response = await http.post(uri, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      'imageName': imagename,
    });
    print(response.body);
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
