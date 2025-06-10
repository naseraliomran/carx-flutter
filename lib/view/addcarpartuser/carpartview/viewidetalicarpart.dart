import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addcarpart/addcarpartcontroller.dart';
import 'package:car_x/view/addcarpart/carpartview/deletecarpart.dart';
import 'package:car_x/view/addcarpart/carpartview/salequancontroller.dart';
import 'package:car_x/view/addcarpart/carpartview/updatecarpart.dart';

import 'package:car_x/view/addcarpartuser/addcarpartcontroller.dart';
import 'package:car_x/view/addcarpartuser/carpartview/deletecarpart.dart';
import 'package:car_x/view/addcarpartuser/carpartview/updatecarpart.dart';
import 'package:car_x/view/addcarpartuser/carpartview/viwecarpartconn.dart';
import 'package:car_x/view/addcarpartuser/order/viewmisscarpart.dart';
import 'package:car_x/view/addcarpartuser/order/viewmyorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewimagecarpartuser extends StatelessWidget {
  deletecarpartuserimagecontroller controller = Get.put(
    deletecarpartuserimagecontroller(),
  );

  addcarpartusercontrol controller1 = Get.put(
    addcarpartusercontrol(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<getallcarpartusercontroller>(
            init: getallcarpartusercontroller(),
            builder: (controller2) => RefreshIndicator(
                onRefresh: () => controller2.getallcarspaartuser(),
                child: ListView.builder(
                    itemCount: controller2.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(14),
                        child: Card(
                          color: Colors.blue[700],
                          child: Column(
                            children: [
                              Container(
                                  child: Image.network(
                                      "${ApiConfig.baseUrl}/images/CarPartsPictures/" +
                                          (controller2.data[index]['imagPart']
                                              .toString()))),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            iconSize: 33,
                                            onPressed: () {
                                              controller.id =
                                                  controller2.data[index]['id'];
                                              Get.defaultDialog(
                                                  backgroundColor:
                                                      Color(0xFF164f9c),
                                                  title: "تحذير ",
                                                  titleStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  middleTextStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .displayMedium,
                                                  middleText:
                                                      "هل انت متاكد من العملية؟",
                                                  onConfirm: () {
                                                    controller
                                                        .deletecarpartuserimageconn();
                                                  },
                                                  confirmTextColor:
                                                      Colors.white,
                                                  buttonColor: Colors.red,
                                                  textConfirm: "تاكيد");
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red[400],
                                            )),
                                        Text('حذف',
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15,
                                                fontFamily: 'Cairo-Regular'))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            iconSize: 33,
                                            onPressed: () {
                                              controller2.id =
                                                  controller2.data[index]['id'];
                                              Get.to(() =>
                                                  updatecarpartuserpage());
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.grey[100],
                                            )),
                                        Text('تعديل',
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15,
                                                fontFamily: 'Cairo-Regular'))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            iconSize: 33,
                                            onPressed: () {
                                              controller2.id =
                                                  controller2.data[index]['id'];
                                              Get.defaultDialog(
                                                  backgroundColor:
                                                      Color(0xFF164f9c),
                                                  title: "التفاصيل ",
                                                  titleStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  content: Column(children: [
                                                    Text(
                                                      'اسم القطعة : ' +
                                                          controller2
                                                              .data[index]
                                                                  ['partName']
                                                              .toString(),
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'Cairo-Regular'),
                                                    ),
                                                    Text(
                                                      ' كمية القطعة : ' +
                                                          controller2
                                                              .data[index]
                                                                  ['Quantity']
                                                              .toString(),
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'Cairo-Regular'),
                                                    )
                                                  ]));
                                            },
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.grey[100],
                                            )),
                                        Text('التفاصيل',
                                            style: TextStyle(
                                                color: Color(0xFFF8F8F9),
                                                fontSize: 15,
                                                fontFamily: 'Cairo-Regular'))
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                        ),
                      );
                    }))));
  }
}
