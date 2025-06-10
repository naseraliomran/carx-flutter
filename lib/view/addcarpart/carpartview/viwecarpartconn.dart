import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getallcarpartcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("carpartemptoken");
    super.onInit();
  }

  var id;
  var token;
  List data = [];

  getallcarspaart() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Parts/getAll');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    data = json.decode(response.body);
    print(data);
    update();
  }
}
