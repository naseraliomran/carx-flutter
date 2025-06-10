import 'package:car_x/control/dashbordcontrol/dashbord_controller.dart';
import 'package:car_x/view/addcarpartuser/addcarpart.dart';
import 'package:car_x/view/addcarpartuser/buypage.dart';

import 'package:car_x/view/home/homepage.dart';
import 'package:car_x/view/my_account/accountpage.dart';

import 'package:car_x/view/sell%20copy/sellpage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashbordcontroller>(
        init: dashbordcontroller(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  onTap: controller.changetabindex,
                  currentIndex: controller.tabsindex,
                  unselectedItemColor: Theme.of(context).cardColor,
                  selectedItemColor: Theme.of(context).primaryColorDark,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "الرئيسية"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sell), label: "المعرض"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.car_repair), label: "الصيانة"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.manage_accounts), label: "حسابي"),
                  ]),
              body: SafeArea(
                  child: IndexedStack(
                index: controller.tabsindex,
                children: [
                  Homepage(),
                  sellnrentpage(),
                  mentpage(),
                  accountpage(),
                ],
              )));
        });
  }
}
