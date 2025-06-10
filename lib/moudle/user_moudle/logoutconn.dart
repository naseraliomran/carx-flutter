import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class logoutcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    super.onInit();
  }

  erase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    erasetoken = prefs.clear();
  }

  var erasetoken;
  var token;

  logoutco() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/logout');
    var response =
        await http.post(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    var data = response.body;
    if (status == 200) {
      Get.offAllNamed("signup");

      print(data);
    }
  }
}
