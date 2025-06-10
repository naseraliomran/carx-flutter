import 'package:car_x/view/rent/forsell.dart';
import 'package:car_x/view/sell%20copy/forsell%20copy.dart';
import 'package:car_x/view/sell%20copy/forsell.dart';
import 'package:car_x/view/sell%20copy/tabsell.dart';
import 'package:car_x/view/sell/forsell.dart';
import 'package:car_x/view/sell/sold.dart';
import 'package:car_x/view/sell/tabsell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sellnrentpage extends StatelessWidget {
  sellnrenttab controller1 = Get.put(
    sellnrenttab(),
  );
  getallsellscarcontroller controller = Get.put(
    getallsellscarcontroller(),
  );
  getallrentscarcontroller controller2 = Get.put(
    getallrentscarcontroller(),
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
          controller2.car.isEmpty
              ? Center(
                  child: Text(
                    "لا يوجد سيارات لعرضها ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 36,
                        fontFamily: 'Cairo-Regular'),
                  ),
                )
              : forrents(),
          controller.car.isEmpty
              ? Center(
                  child: Text(
                    "لا يوجد سيارات لعرضها ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 36,
                        fontFamily: 'Cairo-Regular'),
                  ),
                )
              : forsells(),
        ],
      ),
    );
  }
}
