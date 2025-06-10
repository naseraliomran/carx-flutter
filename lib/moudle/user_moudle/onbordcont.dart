import 'package:car_x/control/user_controller/logincontroller.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onbordco extends GetxController {
  Userlogincontroler controller = Get.put(Userlogincontroler());
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    per = prefs.getString("per");
    print(token);
    print(per);
    super.onInit();
  }

  var token;
  auth() {
    if (token == null) {
      Get.toNamed("/signup");
    } else {
      decide();
    }
  }

  var per;
  decide() {
    if (per == "Customer") {
      Get.toNamed("/dashbord");
    } else if (per == "Admin") {
      Get.toNamed("/admindashbord");
    } else if (per == "Company Director") {
      Get.toNamed("/manegerdashbord");
    } else if (per == "Workshop Owner") {
      Get.toNamed("/workdashbord");
    } else if (per == "Employee") {
      Get.toNamed("/employeedashbord");
    } else if (per == "Salesman") {
      Get.toNamed("/salemandashbord");
    }
  }
}
