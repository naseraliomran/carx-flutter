import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addmycarcontrol extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    if (kDebugMode) debugPrint(token);

    super.onInit();
  }

  String name = "";
  String describe = "";
  var manufacturingYear;
  var price;
  String color = "";
  String city = "";
  var mileage;
  var motionVector;
  var engineCapacity;
  var state;
  String model = "";
  var token;
  final GlobalKey<FormState> keymycar = GlobalKey<FormState>();
  checkaddcar() {
    final isvalid = keymycar.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keymycar.currentState!.save();
  }

  ImagePicker imagePicker = ImagePicker();

  List<XFile>? image = [];

  Future<void> uploadPhoto() async {
    final List<XFile>? picked = await imagePicker.pickMultiImage();
    if (picked != null && picked.isNotEmpty) {
      image!.addAll(picked);
      update();
    }
  }
}
