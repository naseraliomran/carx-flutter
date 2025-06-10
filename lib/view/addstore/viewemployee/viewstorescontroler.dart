import 'dart:convert';
import 'package:car_x/view/addempl/viewemployee/viewemployee.dart';
import 'package:car_x/view/addstore/viewemployee/viewestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class viewestorecontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("emplotoken");

    super.onInit();
  }

  var token;

  String storename = "";
  String atoreaddress = "";
  String phonenumber = "";
  String city = "";
  var id;
  List data = [];

  Future<void> getallstores() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Store/getAll');

    var response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    var status = response.statusCode;

    newMethod(response);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (status == 200) {
      Get.to(() => viewestores());
    } else {}
    update();
  }

  newMethod(http.Response response) => data = jsonDecode(response.body);
}
