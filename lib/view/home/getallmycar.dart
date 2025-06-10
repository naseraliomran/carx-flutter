import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getallmycarcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    getallmycarsuser();
    print(token);
    super.onInit();
  }

  var imagename;
  var id;
  var token;
  var data;
  List car = [];
  List imagecar = [];
  List imagecardetail = [];
  var detaildata;
  Future getallmycarsuser() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Car/getAllMyCars');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data = json.decode(response.body);

    if (status == 200) {
      car = data;
      print(data);
      update();
    }
  }
}
