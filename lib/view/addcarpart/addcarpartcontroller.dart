import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addcarpartcontrol extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("carpartemptoken");
    if (kDebugMode) debugPrint(token);

    super.onInit();
  }

  String partName = "";
  String manufacturingCountry = "";
  String partPrice = "";
  String Quantity = "";

  String saledQuantity = "";
  var token;
  final GlobalKey<FormState> keycarpart = GlobalKey<FormState>();
  final GlobalKey<FormState> keycarpartupdate = GlobalKey<FormState>();
  checkaddcar() {
    final isvalid = keycarpart.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keycarpart.currentState!.save();
  }

  ImagePicker imagePicker = ImagePicker();

  List<XFile>? image = [];

  var imageforapi;
  Future<void> uploadPhoto() async {
    imageforapi = File(image.toString().split('/').last);
    final List<XFile>? _image = (await imagePicker.pickMultiImage());
    if (image != null) {
      image!.addAll(_image!);
      update();
    }
  }
}
