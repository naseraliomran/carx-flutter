import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addcarcontrol extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken");
    print(token);
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
  final GlobalKey<FormState> keycar = GlobalKey<FormState>();
  checkaddcar() {
    final isvalid = keycar.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keycar.currentState!.save();
  }

  ImagePicker imagePicker = ImagePicker();

  List<XFile>? image = [];

  var imageforapi;
  Future<void> uploadPhoto() async {
    imageforapi = File(image.toString());
    final List<XFile>? _image = (await imagePicker.pickMultiImage());
    if (image != null) {
      update();
      image!.addAll(_image!);
    }
    for (var i = 0; i < image!.length; i++) {
      print(image![i].path.toString().split('/').last);
    }
  }
}
