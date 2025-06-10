import 'package:car_x/moudle/employee/aaddemployee.dart';
import 'package:car_x/view/addempl/viewemployee/delete_employee.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:car_x/view/addsaleman/viewsaleman/delete_saleman.dart';

import 'package:car_x/view/addsaleman/viewsaleman/viewsalemancontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewsaleman extends StatelessWidget {
  viewesaleecontroller controller2 = Get.put(
    viewesaleecontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller2.getallsaleman(),
        child: GetBuilder<viewesaleecontroller>(
          init: viewesaleecontroller(),
          builder: (controller) => ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                        margin: EdgeInsets.all(16),
                        color: Theme.of(context).primaryColor,
                        elevation: 6,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "اسم الموظف   " +
                                        controller.data[index]['name']
                                            .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 18),
                                  child: GetBuilder<viewesaleecontroller>(
                                    init: viewesaleecontroller(),
                                    builder: (controller) => PopupMenuButton(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "المزيد",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        elevation: 15,
                                        color: Color(0xFF164f9c),
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                                child: TextButton(
                                                    onPressed: () {
                                                      controller.id = controller
                                                          .data[index]['id'];
                                                      Get.defaultDialog(
                                                        backgroundColor:
                                                            Color(0xFF164f9c),
                                                        title: "تحذير ",
                                                        titleStyle: TextStyle(
                                                            color: Color(
                                                                0xFFE44848),
                                                            fontSize: 28,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Cairo-Regular'),
                                                        middleTextStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displayMedium,
                                                        middleText:
                                                            "هل انت متاكد من العملية؟",
                                                        confirm: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    30.0),
                                                              ),
                                                            ),
                                                            child:
                                                                MaterialButton(
                                                              child: Text(
                                                                  "تاكيد",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFFCC2929),
                                                                      fontSize:
                                                                          28,
                                                                      fontFamily:
                                                                          'Cairo-Regular')),
                                                              onPressed: () {
                                                                deletesaleconn();
                                                                Get.back();
                                                              },
                                                            )),
                                                        confirmTextColor:
                                                            Colors.white,
                                                        buttonColor: Colors.red,
                                                      );
                                                    },
                                                    child: Text(
                                                      "حذف  الموظف",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ))),
                                          ];
                                        }),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "هاتف الموظف" +
                                  controller.data[index]['mobile'].toString(),
                              style: Theme.of(context).textTheme.displaySmall,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ))
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
