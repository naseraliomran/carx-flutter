import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addsalemancontroler extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");
    if (kDebugMode) debugPrint(token);
    super.onInit();
  }

  var id;
  var token;
  final GlobalKey<FormState> keysale = GlobalKey<FormState>();
  final GlobalKey<FormState> keyupdatesale = GlobalKey<FormState>();
  String username = "";
  String phonenumber = "";
  String age = "";
  String jop = "رجل مبيعات";
  String password = "";
  String gender = "";

  void checkvalidation() {
    final isvalid = keysale.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keysale.currentState!.save();
  }
}
