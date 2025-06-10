import 'package:car_x/view/rent/forsell.dart';
import 'package:car_x/view/rent/sold.dart';
import 'package:car_x/view/rent/tabsell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buypage extends StatelessWidget {
  buypage({Key? key}) : super(key: key);
  renttab controller1 = Get.put(
    renttab(),
  );
  getallrentcarcontroller controller = Get.put(
    getallrentcarcontroller(),
  );
  getallrentedcarcontroller controller2 = Get.put(
    getallrentedcarcontroller(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF164f9c),
        automaticallyImplyLeading: false,
        flexibleSpace: Text(
          'المعرض',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 26,
              fontFamily: 'Cairo-Regular'),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: controller1.con,
          tabs: controller1.tab,
        ),
      ),
      body: TabBarView(
        controller: controller1.con,
        children: [
          controller2.data.toString().contains('There are no rental cars')
              ? Center(
                  child: Text(
                    "لا يوجد سيارات لعرضها ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 36,
                        fontFamily: 'Cairo-Regular'),
                  ),
                )
              : rented(),
          controller2.data
                  .toString()
                  .contains('you are dont have a cars For Rental')
              ? Center(
                  child: Text(
                    "لا يوجد سيارات لعرضها ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 36,
                        fontFamily: 'Cairo-Regular'),
                  ),
                )
              : forrent(),
        ],
      ),
    );
  }
}
