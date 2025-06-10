import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class workashopcontrol extends GetxController {
  var timefrom = "";
  String id = "";
  var timeto = "";
  String username = "";
  String phone = "";
  String password = "";
  String gender = "";
  String age = "";
  final GlobalKey<FormState> key4 = GlobalKey<FormState>();
  var long;
  var lat;

  String name_ar = "";
  String address = "";
  String phonenumber = "";
  String cityid = "";
  void checkaddcompany() {
    final isvalid = key4.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key4.currentState!.save();
  }
}
