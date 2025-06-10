import 'package:car_x/control/view_workshop/view_workshope_cont.dart';
import 'package:car_x/control/worksope/workshope_controller.dart';
import 'package:car_x/moudle/admin/add_workshop.dart';
import 'package:car_x/moudle/admin/delete_workshope.dart';
import 'package:car_x/moudle/admin/update_workshop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewworkshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<viewworkshopcontroller>(
        init: viewworkshopcontroller(),
        builder: (controller) => RefreshIndicator(
          onRefresh: () => controller.getallworkshop(),
          child: ListView.builder(
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
                                "اسم الورشة  " +
                                    controller.data[index]["name"].toString(),
                                style: Theme.of(context).textTheme.displaySmall,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: GetBuilder<viewworkshopcontroller>(
                                builder: (controller) => PopupMenuButton(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "المزيد",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    elevation: 15,
                                    color: Color(0xFF2662CA),
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem(
                                            child: TextButton(
                                                onPressed: () {
                                                  controller.id = controller
                                                      .data[index]['id'];
                                                  Get.to(() => updatewo());
                                                },
                                                child: Text(
                                                  "تعديل الورشة",
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
                                                        color:
                                                            Color(0xFFE44848),
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
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                30.0),
                                                          ),
                                                        ),
                                                        child: MaterialButton(
                                                          child: Text("تاكيد",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFCC2929),
                                                                  fontSize: 28,
                                                                  fontFamily:
                                                                      'Cairo-Regular')),
                                                          onPressed: () {
                                                            deleteworkshopconn();
                                                            Get.back();
                                                          },
                                                        )),
                                                    confirmTextColor:
                                                        Colors.white,
                                                    buttonColor: Colors.red,
                                                  );
                                                },
                                                child: Text(
                                                  "حذف الورشة",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ))),
                                        PopupMenuItem(
                                            child: TextButton(
                                                onPressed: () {
                                                  if (controller.data[index]
                                                          ["available"] ==
                                                      0) {
                                                    Get.defaultDialog(
                                                      backgroundColor:
                                                          Color(0xFF164f9c),
                                                      title: "الحالة ",
                                                      titleStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                      middleText:
                                                          "الورشة فعالة ",
                                                      middleTextStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                    );
                                                  } else {
                                                    Get.defaultDialog(
                                                      backgroundColor:
                                                          Color(0xFF164f9c),
                                                      title: "الحالة ",
                                                      titleStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                      middleText:
                                                          "الورشة غير فعالة",
                                                      middleTextStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                    );
                                                  }
                                                },
                                                child: Text(
                                                  "حالة الورشة",
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
                          "هاتف الورشة " +
                              '0' +
                              controller.data[index]["phone"].toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<viewworkshopcontroller>(
                            builder: (controller) => MaterialButton(
                                color: Colors.blue[600],
                                onPressed: () {
                                  if (controller.data[index]
                                          ["workshop_owner"] ==
                                      null) {
                                    Get.defaultDialog(
                                      backgroundColor: Color(0xFF164f9c),
                                      title: "تحذير ",
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      middleText: "لا يوجد مدير للورشة",
                                      middleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    );
                                  } else {
                                    Get.defaultDialog(
                                      backgroundColor: Color(0xFF164f9c),
                                      title: "التفاصيل ",
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      content: Column(children: [
                                        Text(
                                            "   اسم مدير الورشة " +
                                                controller.data[index]
                                                        ["workshop_owner"]
                                                        ["name"]
                                                    .toString(),
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[200],
                                                fontFamily: 'Cairo-Regular')),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                            "   هاتف مدير الورشة " +
                                                controller.data[index]
                                                        ["workshop_owner"]
                                                        ["mobile"]
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[200],
                                                fontFamily: 'Cairo-Regular')),
                                      ]),
                                    );
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "التفاصيل",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    )
                                  ],
                                )))
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
