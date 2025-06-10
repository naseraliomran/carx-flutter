import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class bookingemploo extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken");
    soldbookingemploo();
    rentbookingemploo();
    update();
    super.onInit();
  }

  var ispress;
  var id;
  var token;
  Future sendbookingemplo() async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/Employee/Booking/bookingCar/$id');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;

    print(status);
    if (response.body.isNotEmpty) {
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

  Future cancelebookingemplo() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Employee/Booking/cancellationOfBooking/$id');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;

    print(status);
    if (response.body.isNotEmpty) {
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

  Future rentbookingemploo() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Employee/Booking/getRequestRentalBookings');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;
    data1 = json.decode(response.body);
    if (data1.toString().isEmpty) {
      item1 = data1;
    }
    update();
    print(data1);
  }

  Future soldbookingemploo() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Employee/Booking/getRequestSoldBookings');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
      },
    );

    var status = response.statusCode;
    data2 = json.decode(response.body);
    if (data2.toString().isEmpty) {
      item2 = data2;
    }
    update();
    print(data2);
  }

  Future conformreqemploo() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Employee/Booking/confirmRequest/$id');
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

  Future rejectreqemploo() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Employee/Booking/rejectionBooking/$id');
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
