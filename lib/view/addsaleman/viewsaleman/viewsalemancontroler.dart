import 'dart:convert';

import 'package:car_x/view/addsaleman/viewsaleman/viewesaleman.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class viewesaleecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");
    super.onInit();
  }

  var token;

  String username = "";
  String phonenumber = "";
  String password = "";
  String gender = "";
  String age = "";

  List data = [];

  var id;
  Future<void> getallsaleman() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Salesman/getSalesman/$id');

    var response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    var status = response.statusCode;

    data = jsonDecode(response.body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (status == 200) {
      Get.to(() => viewsaleman());
    } else {}
    update();
  }
}
