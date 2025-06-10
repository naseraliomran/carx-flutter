import 'package:get/get.dart';

class admindashbordcontroller extends GetxController {
  var tabsindex = 0;
  changetabindex(int index) {
    tabsindex = index;
    update();
  }
}
