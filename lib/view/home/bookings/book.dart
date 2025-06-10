import 'dart:convert';

import 'package:car_x/moudle/user_moudle/loginconnection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class booking extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    mybooking();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    mybooking();
    update();
    super.onReady();
  }

  var ispress = false;
  var id;
  var token;
  var datac;
  Future sendbooking() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Booking/bookingCar/$id');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;
    datac = jsonDecode(response.body);
    print(response.body);
    print(status);

    if (data.toString().contains('false')) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "لقد تجاوت الحد اليومي للحجز ",
          style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 26,
              fontFamily: 'Cairo-Regular'),
          textAlign: TextAlign.center,
        ),
        messageText: LottieBuilder.asset(
          "assets/images/94303-failed.json",
          width: 170,
          height: 170,
          repeat: false,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
      );
    } else if (data.toString().contains('This Car has been Booked')) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "السيارة محجوزة بالفعل",
          style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 26,
              fontFamily: 'Cairo-Regular'),
          textAlign: TextAlign.center,
        ),
        messageText: LottieBuilder.asset(
          "assets/images/94303-failed.json",
          width: 170,
          height: 170,
          repeat: false,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
      );

      update();
    } else {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تمت أرسال الطلب  بنجاح",
          style: TextStyle(
              color: Color(0xFF2E2E2E),
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

  Future cancelebooking() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/User/Booking/cancellationOfBooking/$id');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;
    var datax = response.body;
    print(status);
    if (data.toString().contains('false')) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "لقد تجاوت الحد اليومي للحجز ",
          style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 26,
              fontFamily: 'Cairo-Regular'),
          textAlign: TextAlign.center,
        ),
        messageText: LottieBuilder.asset(
          "assets/images/94303-failed.json",
          width: 170,
          height: 170,
          repeat: false,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
      );
    } else {
      print(datax);
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تمت أرسال الطلب  بنجاح",
          style: TextStyle(
              color: Color(0xFF2E2E2E),
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

  List item = [];
  List item1 = [];
  List item2 = [];
  var data;
  var data1;
  var data2;
  Future mybooking() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Booking/myBookings');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );
    update();
    var status = await response.statusCode;
    data = json.decode(response.body);
    item = data;

    print(data);
  }

  Future rentbooking() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Booking/soldBookings');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );
    refresh();
    var status = response.statusCode;
    data1 = json.decode(response.body);
    item1 = data1;
    update();
    print(data1);
  }

  Future soldbooking() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Booking/soldBookings');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;
    data2 = json.decode(response.body);
    item2 = data2;
    update();
    print(data2);
  }

  Future conformreq() async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/User/Booking/confirmRequest/$id');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;

    update();
    print(status);
    if (status == 200) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تم تأكيد الحجز بنجاح",
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

  Future rejectreq() async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/User/Booking/rejectionBooking/$id');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;

    update();
    print(status);
    if (status == 200) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تم رفض الحجز بنجاح",
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
}
