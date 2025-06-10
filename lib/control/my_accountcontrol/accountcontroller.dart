import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class accountcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    profileco();

    super.onInit();
  }

  var token;
  Map users = {};

  profileco() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/me');

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}'});
    var data = jsonDecode(response.body);
    var status = response.statusCode;
    if (status == 200) {
      users = data;
    }
  }
}
