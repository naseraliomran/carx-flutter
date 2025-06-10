import 'package:get/get.dart';

class workshopdashbordcontroller extends GetxController {
  var tabsindex = 0;
  changetabindex(int index) {
    tabsindex = index;
    update();
  }
}
