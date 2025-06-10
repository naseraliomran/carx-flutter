import 'package:car_x/control/admindashbord/admindashbord_controll.dart';
import 'package:car_x/view/adminview/cars_company/companys.dart';
import 'package:car_x/view/adminview/view_cars_comp/view_companys.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<admindashbordcontroller>(
      init: admindashbordcontroller(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: const Text('ادارة الشركات'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: IndexedStack(
                key: ValueKey(controller.tabsindex),
                index: controller.tabsindex,
                children: [
                  companys(),
                  viewcompanys(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: GlassmorphicContainer(
            width: double.infinity,
            height: 70,
            borderRadius: 0,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 0,
            linearGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.5)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                selectedIndex: controller.tabsindex,
                onDestinationSelected: controller.changetabindex,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                height: 60,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.add_business_outlined),
                    selectedIcon: Icon(Icons.add_business, size: 28),
                    label: 'إضافة شركة',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.list_alt_outlined),
                    selectedIcon: Icon(Icons.list_alt, size: 28),
                    label: 'عرض الشركات',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
