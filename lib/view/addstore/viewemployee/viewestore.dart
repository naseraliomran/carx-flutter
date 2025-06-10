import 'package:car_x/moudle/store/storeconn.dart';
import 'package:car_x/view/addsaleman/addsaleman.dart';
import 'package:car_x/view/addsaleman/addsalemancontroller.dart';

import 'package:car_x/view/addsaleman/viewsaleman/viewsalemancontroler.dart';

import 'package:car_x/view/addstore/viewemployee/delete_store.dart';
import 'package:car_x/view/addstore/viewemployee/frezz_store.dart';
import 'package:car_x/view/addstore/viewemployee/unfrezz_store.dart';
import 'package:car_x/view/addstore/viewemployee/viewstorescontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewestores extends StatelessWidget {
  viewestorecontroller controller2 = Get.put(
    viewestorecontroller(),
  );
  viewesaleecontroller controller3 = Get.put(
    viewesaleecontroller(),
  );
  var frezz = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller2.getallstores(),
        child: GetBuilder<viewestorecontroller>(
          init: viewestorecontroller(),
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
                                    "اسم المخزن   " +
                                        controller.data[index]['storeName']
                                            .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 18),
                                  child: GetBuilder<viewestorecontroller>(
                                    init: viewestorecontroller(),
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
                                                      Get.to(
                                                          () => updatestore());
                                                    },
                                                    child: Text(
                                                      "تعديل بيانات المخزن ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ))),
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
                                                                deletstoreconn();
                                                                Get.back();
                                                              },
                                                            )),
                                                        confirmTextColor:
                                                            Colors.white,
                                                        buttonColor: Colors.red,
                                                      );
                                                    },
                                                    child: Text(
                                                      "حذف  المخزن",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ))),
                                            PopupMenuItem(
                                                child: TextButton(
                                                    onPressed: () {
                                                      if (controller.data[index]
                                                              ["freeze"] ==
                                                          1) {
                                                        Get.defaultDialog(
                                                          backgroundColor:
                                                              Color(0xFF164f9c),
                                                          title: "تحذير ",
                                                          titleStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayMedium,
                                                          middleText:
                                                              "المخزن مجمد",
                                                          middleTextStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                        );
                                                      } else {
                                                        Get.defaultDialog(
                                                          backgroundColor:
                                                              Color(0xFF164f9c),
                                                          title: "تحذير ",
                                                          titleStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayMedium,
                                                          middleText:
                                                              "المخزن غير مجمد",
                                                          middleTextStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      "حالة المخزن",
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
                              " هاتف المخزن  " +
                                  controller.data[index]["phoneNumber"]
                                      .toString(),
                              style: Theme.of(context).textTheme.displaySmall,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.data[index]['freeze'] == 0
                                    ? MaterialButton(
                                        color: Colors.lightBlue[400],
                                        onPressed: () {
                                          controller.id = controller.data[index]
                                                  ['id']
                                              .toString();
                                          frezzstoreconn();
                                        },
                                        child: Text(
                                          "تجميد  المخزن",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      )
                                    : MaterialButton(
                                        color: Colors.redAccent[400],
                                        onPressed: () {
                                          controller.id = controller.data[index]
                                                  ['id']
                                              .toString();
                                          unfrezzstoreconn();
                                        },
                                        child: Text(
                                          "الغاء التجميد",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  color: Colors.blue[400],
                                  onPressed: () {
                                    controller3.id =
                                        controller.data[index]['id'].toString();
                                    controller3.getallsaleman();
                                  },
                                  child: Text(
                                    "عرض الموظفين",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                MaterialButton(
                                  color: Colors.blue[400],
                                  onPressed: () {
                                    controller3.id =
                                        controller.data[index]['id'].toString();
                                    Get.to(() => addsaleman());
                                  },
                                  child: Text(
                                    "اضف موظف",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
