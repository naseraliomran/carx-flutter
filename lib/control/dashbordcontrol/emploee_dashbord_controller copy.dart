import 'package:get/get.dart';

class employeedashbordcontroller extends GetxController {
  var tabsindex = 0;
  changetabindex(int index) {
    tabsindex = index;
    update();
  }
}
