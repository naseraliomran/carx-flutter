import 'package:car_x/control/dashbordcontrol/dashbord_controller.dart';
import 'package:car_x/view/cars/addcar/addcar.dart';
import 'package:car_x/view/homeforemployee/homeforemployee.dart';
import 'package:car_x/view/my_account/accountpage.dart';
import 'package:car_x/view/rent/buypage.dart';
import 'package:car_x/view/sell/sellpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addcardashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashbordcontroller>(
        init: dashbordcontroller(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 4,
                  onTap: controller.changetabindex,
                  currentIndex: controller.tabsindex,
                  unselectedItemColor: Colors.blue[100],
                  selectedItemColor: Theme.of(context).primaryColorDark,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: "الرئيسية"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.sell,
                        ),
                        label: "بيع"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add,
                        ),
                        label: "اضف سيارة"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.money,
                        ),
                        label: "أجار"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.manage_accounts,
                        ),
                        label: "حسابي"),
                  ]),
              body: SafeArea(
                  child: IndexedStack(
                index: controller.tabsindex,
                children: [
                  Homepageforemployee(),
                  sellpage(),
                  addcarpage(),
                  buypage(),
                  accountpage(),
                ],
              )));
        });
  }
}
