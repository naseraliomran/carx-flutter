import 'package:car_x/control/dashbordcontrol/maneger_dashbord_controller%20copy%202.dart';
import 'package:car_x/view/addempl/addempl.dart';
import 'package:car_x/view/addstore/addstore.dart';
import 'package:car_x/view/home/homepage.dart';
import 'package:car_x/view/homeforemployee/homeforemployee.dart';
import 'package:car_x/view/manegerdashpord/homepage.dart';
import 'package:car_x/view/my_account/accountpage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class manegerdashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<manegerdashbordcontroller>(
        init: manegerdashbordcontroller(),
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
                        icon: Icon(Icons.store), label: "اضف مخزن"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add), label: "اضف موظف"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.manage_accounts), label: "حسابي"),
                  ]),
              body: SafeArea(
                  child: IndexedStack(
                index: controller.tabsindex,
                children: [
                  Homepageman(),
                  addstore(),
                  addempl(),
                  accountpage(),
                ],
              )));
        });
  }
}
