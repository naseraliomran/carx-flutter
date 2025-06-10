import 'package:get/get.dart';

class manegerdashbordcontroller extends GetxController {
  var tabsindex = 0;
  changetabindex(int index) {
    tabsindex = index;
    update();
  }
}
