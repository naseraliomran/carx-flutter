import 'package:car_x/view/manegerdashpord/homepage.dart';
import 'package:car_x/view/my_account/accountpage.dart';
import 'package:car_x/view/workshop/mentview.dart';
import 'package:car_x/view/workshop/workshopdashcont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class workshopdashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<workshopdashbordcontroller>(
        init: workshopdashbordcontroller(),
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
                          Icons.pending,
                        ),
                        label: "الطلبات"),
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
                  Homepageman(),
                  mentview(),
                  accountpage(),
                ],
              )));
        });
  }
}
