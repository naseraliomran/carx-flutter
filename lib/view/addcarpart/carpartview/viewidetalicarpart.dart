import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addcarpart/addcarpartcontroller.dart';
import 'package:car_x/view/addcarpart/carpartview/deletecarpart.dart';
import 'package:car_x/view/addcarpart/carpartview/salequancontroller.dart';
import 'package:car_x/view/addcarpart/carpartview/updatecarpart.dart';
import 'package:car_x/view/addcarpart/carpartview/viwecarpartconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewimagecarpart extends StatelessWidget {
  getallcarpartcontroller controller2 = Get.put(
    getallcarpartcontroller(),
  );
  deletecarpartimagecontroller controller = Get.put(
    deletecarpartimagecontroller(),
  );
  saleqcarpartcontrol controller3 = Get.put(
    saleqcarpartcontrol(),
  );
  addcarpartcontrol controller1 = Get.put(
    addcarpartcontrol(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<getallcarpartcontroller>(
            init: getallcarpartcontroller(),
            builder: (controller2) => RefreshIndicator(
                onRefresh: () => controller2.getallcarspaart(),
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
                                                        .deletecarpartimageconn();
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
                                              Get.to(() => updatecarpartpage());
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
                                              var ruan = controller2.data[index]
                                                      ['Quantity']
                                                  .toString();
                                              Get.defaultDialog(
                                                  backgroundColor:
                                                      Color(0xFF164f9c),
                                                  title: "التفاصيل ",
                                                  titleStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  content: Column(
                                                    children: [
                                                      ruan
                                                              .toString()
                                                              .contains('4')
                                                          ? Text(
                                                              'تبقى اربعة(4) قطع بالمخزن',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFDC2424),
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      'Cairo-Regular'),
                                                            )
                                                          : Text(''),
                                                      Text(
                                                        'اسم القطعة : ' +
                                                            controller2
                                                                .data[index]
                                                                    ['partName']
                                                                .toString(),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Cairo-Regular'),
                                                      ),
                                                      Text(
                                                        'كمية القطع : ' +
                                                            controller2
                                                                .data[index]
                                                                    ['Quantity']
                                                                .toString(),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'Cairo-Regular'),
                                                      ),
                                                      Text(
                                                        'ادخل الكمية المباعة*',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Cairo-Regular'),
                                                      ),
                                                      Form(
                                                          key:
                                                              controller3.saleq,
                                                          child: TextFormField(
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Cairo-Regular'),
                                                            textAlign:
                                                                TextAlign.right,
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "enter correct information";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            cursorColor:
                                                                Colors.white,
                                                            decoration:
                                                                InputDecoration(
                                                              prefixIcon:
                                                                  Image.asset(
                                                                "assets/images/icons8-ipq-64.png",
                                                                scale: 2,
                                                              ),
                                                              iconColor: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              hintText:
                                                                  " كمية القطع المباعة",
                                                              hintStyle: const TextStyle(
                                                                  fontFamily:
                                                                      'Cairo-Regular',
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            onChanged: (value) {
                                                              controller1
                                                                      .saledQuantity =
                                                                  value;
                                                            },
                                                          ))
                                                    ],
                                                  ),
                                                  onConfirm: () {
                                                    controller3.checksaleq();
                                                    controller3.salequant();
                                                  },
                                                  confirmTextColor:
                                                      Colors.white,
                                                  buttonColor: Colors.blue,
                                                  textConfirm: " تاكيد الكمية");
                                            },
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.grey[100],
                                            )),
                                        Text('التفاصيل',
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15,
                                                fontFamily: 'Cairo-Regular'))
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      );
                    }))));
  }
}
