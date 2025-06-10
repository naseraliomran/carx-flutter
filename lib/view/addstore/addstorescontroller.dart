import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addstorecontroler extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");
    if (kDebugMode) debugPrint(token);
    super.onInit();
  }

  var token;
  final GlobalKey<FormState> keysto = GlobalKey<FormState>();
  final GlobalKey<FormState> keyupdatesto = GlobalKey<FormState>();
  String storename = "";
  String storeaddress = "";
  String phonenumber = "";
  String city = "";

  void checkvalidation() {
    final isvalid = keysto.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keysto.currentState!.save();
  }
}
