import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addemplocontroler extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");
    print(token);
    super.onInit();
  }

  var token;
  final GlobalKey<FormState> keyemp = GlobalKey<FormState>();
  final GlobalKey<FormState> keyupdateemp = GlobalKey<FormState>();
  String username = "";
  String phonenumber = "";
  String age = "";
  String jop = "موظف شركة";
  String password = "";
  String gender = "";

  void checkvalidation() {
    final isvalid = keyemp.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keyemp.currentState!.save();
  }
}
