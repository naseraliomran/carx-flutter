import 'package:car_x/view/addcarpartuser/addcarpart.dart';
import 'package:car_x/view/addcarpartuser/tabsell.dart';
import 'package:car_x/view/rent/forsell.dart';
import 'package:car_x/view/requestment/requestment.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mentpage extends StatelessWidget {
  ment controller1 = Get.put(
    ment(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF164f9c),
        automaticallyImplyLeading: false,
        flexibleSpace: Text(
          ' الصيانة وقطع الغيار',
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
          addcarpartuserpage(),
          viewment(),
        ],
      ),
    );
  }
}
