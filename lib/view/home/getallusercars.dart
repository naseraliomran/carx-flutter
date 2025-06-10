import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getallcarusercontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    getallcarsuser();
    print(token);
    super.onInit();
  }

  @override
  void onReady() {
    getallcarsuser();
    super.onReady();
  }

  var loveid;
  var imagename;
  var id;
  var token;
  var data;
  List car = [];
  List imagecar = [];
  List imagecardetail = [];
  var detaildata;
  Future<void> getallcarsuser() async {
    Future.delayed(Duration(seconds: 2));
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Car/getAll');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });

    var status = response.statusCode;
    data = json.decode(response.body);

    if (status == 200) {
      car = data;
      print(data);
      update();
    }
  }
}
