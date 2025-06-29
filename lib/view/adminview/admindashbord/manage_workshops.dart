import 'package:car_x/control/admindashbord/admindashbord_controll.dart';
import 'package:car_x/view/adminview/view_workshops/view_workshop.dart';
import 'package:car_x/view/adminview/workshope/workshope.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageWorkshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<admindashbordcontroller>(
      init: admindashbordcontroller(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: const Text('ادارة الورشات'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: IndexedStack(
                key: ValueKey(controller.tabsindex),
                index: controller.tabsindex,
                children: [
                  workshop(),
                  viewworkshop(),
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
                    icon: Icon(Icons.build_circle_outlined),
                    selectedIcon: Icon(Icons.build_circle, size: 28),
                    label: 'إضافة ورشة',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.garage_outlined),
                    selectedIcon: Icon(Icons.garage, size: 28),
                    label: 'عرض الورشات',
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
