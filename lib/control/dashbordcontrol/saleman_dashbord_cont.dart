import 'package:get/get.dart';

class salemandashbordcontroller extends GetxController {
  var tabsindex = 0;
  changetabindex(int index) {
    tabsindex = index;
    update();
  }
}
