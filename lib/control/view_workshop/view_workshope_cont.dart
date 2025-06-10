import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class viewworkshopcontroller extends GetxController {
  final GlobalKey<FormState> key6 = GlobalKey<FormState>();
  @override
  Future<void> onInit() async {
    getallworkshop();
    update();
    data;
  }

  var id;
  List data = [];
  Future<void> getallworkshop() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Workshop/getAll');

    var response = await http.get(
      url,
    );
    var status = response.statusCode;
    responce(response);
    if (kDebugMode) debugPrint('Response status: ${response.statusCode}');
    if (kDebugMode) debugPrint('Response body: ${response.body}');
    update();
  }

  responce(http.Response response) => data = jsonDecode(response.body);

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void checkaddcompany() {
    final isvalid = key6.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key6.currentState!.save();
  }
}
