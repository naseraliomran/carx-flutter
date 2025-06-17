import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:io';
import 'package:car_x/view/cars/addcar/addcarcontroller.dart';
import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:car_x/view/home/caruser/addcar/addcarcontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class uplodimagecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken") ?? prefs.getString("token");

    super.onInit();
  }

  addcarcontrol controller = Get.put(
    addcarcontrol(),
  );
  addmycarcontrol controller2 = Get.put(
    addmycarcontrol(),
  );
  getallcarcontroller controller1 = Get.put(
    getallcarcontroller(),
  );

  var token;
  var ids;
  uplodeimageconn() async {
    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/uploadImage/${ids}');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    if (controller.image!.isNotEmpty) {
      for (var i = 0; i < controller.image!.length; i++) {
        request.files.add(http.MultipartFile(
            'imageName',
            File(controller.image![i].path).readAsBytes().asStream(),
            File(controller.image![i].path).lengthSync(),
            filename: controller.image![i].path.split("/").last));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        if (kDebugMode) debugPrint(await response.stream.bytesToString());
      } else {
        if (kDebugMode) debugPrint(response.reasonPhrase);
      }
    } else {}
  }

  uplodemyimageconn() async {
    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Car/uploadImage/${ids}');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    if (controller2.image!.isNotEmpty) {
      for (var i = 0; i < controller2.image!.length; i++) {
        request.files.add(http.MultipartFile(
            'imageName',
            File(controller2.image![i].path).readAsBytes().asStream(),
            File(controller2.image![i].path).lengthSync(),
            filename: controller2.image![i].path.split("/").last));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        if (kDebugMode) debugPrint(await response.stream.bytesToString());
      } else {
        if (kDebugMode) debugPrint(response.reasonPhrase);
      }
    } else {}
  }
}
