import 'package:car_x/moudle/admin/add_comp_dierctor.dart';
import 'package:car_x/moudle/employee/aaddemployee.dart';

import 'package:car_x/view/addempl/viewemployee/delete_employee.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewemployee extends StatelessWidget {
  viewemployeecontroller controller2 = Get.put(
    viewemployeecontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller2.getallemployee(),
        child: GetBuilder<viewemployeecontroller>(
          init: viewemployeecontroller(),
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
                                        controller.data[index]["user"]["name"]
                                            .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 18),
                                  child: GetBuilder<viewemployeecontroller>(
                                    init: viewemployeecontroller(),
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
                                                      controller.id =
                                                          controller.data[index]
                                                              ['userID'];
                                                      Get.to(
                                                          () => updateempl());
                                                    },
                                                    child: Text(
                                                      "تعديل بيانات الموظف ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ))),
                                            PopupMenuItem(
                                                child: TextButton(
                                                    onPressed: () {
                                                      controller.id =
                                                          controller.data[index]
                                                              ['userID'];
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
                                                                deletemployconn();
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
                                  controller.data[index]["user"]["mobile"]
                                      .toString(),
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
