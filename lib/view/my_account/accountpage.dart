import 'package:car_x/control/my_accountcontrol/accountcontroller.dart';
import 'package:car_x/control/user_controller/logincontroller.dart';
import 'package:car_x/moudle/user_moudle/logoutconn.dart';
import 'package:car_x/moudle/user_moudle/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

class accountpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<accountcontroller>(
        init: accountcontroller(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Color(0xFFCEDEF9),
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    LottieBuilder.asset(
                      "assets/images/49896-user-icon.json",
                      width: 160,
                    ),
                    Text(
                      "حسابي",
                      style:
                          TextStyle(fontFamily: 'Cairo-Regular', fontSize: 26),
                    ),
                    Container(
                        margin: EdgeInsets.all(15),
                        width: double.maxFinite,
                        height: 350,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            margin: EdgeInsets.all(16),
                            color: Theme.of(context).primaryColor,
                            elevation: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Text(
                                      controller.users['name'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Text(
                                        controller.users['mobile'].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Text(
                                        controller.users['age'].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 70,
                                  margin: EdgeInsets.all(15),
                                  child: Card(
                                    elevation: 12,
                                    color: Colors.redAccent,
                                    child: GetBuilder<logoutcontroller>(
                                        init: logoutcontroller(),
                                        builder: (controller) {
                                          return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        backgroundColor:
                                                            Color(0xFF164f9c),
                                                        title: "تحذير ",
                                                        titleStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displayLarge,
                                                        middleTextStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displayMedium,
                                                        middleText:
                                                            "هل انت متاكد من العملية؟",
                                                        onConfirm: () {
                                                          controller.logoutco();
                                                          controller.erase();
                                                        },
                                                        confirmTextColor:
                                                            Colors.white,
                                                        buttonColor: Colors.red,
                                                        textConfirm: "تاكيد");
                                                  },
                                                  child: Text(
                                                    "تسجيل الخروج",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Cairo-Regular',
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                          backgroundColor:
                                                              Color(0xFF164f9c),
                                                          title: "تحذير ",
                                                          titleStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                          middleTextStyle: Theme
                                                                  .of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                          middleText:
                                                              "هل انت متاكد من العملية؟",
                                                          onConfirm: () {
                                                            controller
                                                                .logoutco();
                                                            controller.erase();
                                                          },
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.red,
                                                          textConfirm: "تاكيد");
                                                    },
                                                    icon: LottieBuilder.asset(
                                                      "assets/images/68582-log-out.json",
                                                    ))
                                              ]);
                                        }),
                                  ),
                                )
                              ],
                            )))
                  ])));
        });
  }
}
