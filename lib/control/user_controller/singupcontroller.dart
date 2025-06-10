import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usersignupcontroler extends GetxController {
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  String username = "";
  String phonenumber = "";
  String age = "";
  String jop = "";
  String password = "";
  String gender = "";

  void checksingup() {
    final isvalid = key2.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key2.currentState!.save();
  }
}
