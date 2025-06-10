import 'package:car_x/moudle/user_moudle/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userlogincontroler extends GetxController {
  @override
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String phonenumber = "";
  String password = "";

  void checklofin() {
    final isvalid = key.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key.currentState!.save();
  }
}
