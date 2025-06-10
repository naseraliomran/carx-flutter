import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addcopanycontrol extends GetxController {
  final GlobalKey<FormState> key3 = GlobalKey<FormState>();
  String compyname = "";
  String code = "";
  String username = "";
  String phonenumber = "";
  String password = "";
  String gender = "";
  String age = "";

  void checkaddcompany() {
    final isvalid = key3.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key3.currentState!.save();
  }
}
