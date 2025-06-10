import 'package:car_x/control/companys/add_company_controller.dart';
import 'package:car_x/control/view_company/view_companys.dart';
import 'package:car_x/moudle/admin/add_comp_dierctor.dart';
import 'package:car_x/moudle/admin/delete_car_comp_director.dart';
import 'package:car_x/moudle/admin/frezz.dart';
import 'package:car_x/moudle/admin/unfrezz.dart';
import 'package:car_x/moudle/admin/update_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewcompanys extends StatelessWidget {
  addcopanycontrol controller = Get.put(
    addcopanycontrol(),
  );
  viewcopmanycontroller controller2 = Get.put(
    viewcopmanycontroller(),
  );
  var freezpress = false;
  var comppress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller2.getallcompany(),
        child: GetBuilder<viewcopmanycontroller>(
          init: viewcopmanycontroller(),
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
                                "اسم الشركة   " +
                                    controller.data[index]["nameCompany"]
                                        .toString(),
                                style: Theme.of(context).textTheme.displaySmall,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: GetBuilder<viewcopmanycontroller>(
                                init: viewcopmanycontroller(),
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
                                    color: Color(0xFF164f9c),
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem(
                                            child: controller.data[index]
                                                        ['company_director'] ==
                                                    null
                                                ? MaterialButton(
                                                    onPressed: () {
                                                      controller.id = controller
                                                          .data[index]['id'];
                                                      Get.to(() => add());
                                                    },
                                                    child: Text(
                                                      "اضافة مدير شركة",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    ))
                                                : TextButton(
                                                    onPressed: () {
                                                      controller.id = controller
                                                              .data[index]
                                                          ['companyDirectorID'];
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
                                                                deletecompconn();
                                                                Get.back();
                                                              },
                                                            )),
                                                        confirmTextColor:
                                                            Colors.white,
                                                        buttonColor: Colors.red,
                                                      );
                                                    },
                                                    child: Text(
                                                      "حذف مدير شركة",
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
                                                      confirm: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  30.0),
                                                            ),
                                                          ),
                                                          child: MaterialButton(
                                                            child: Text("تاكيد",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF000000),
                                                                    fontSize:
                                                                        28,
                                                                    fontFamily:
                                                                        'Cairo-Regular')),
                                                            onPressed: () {
                                                              updatecompconn();
                                                              Get.back();
                                                            },
                                                          )),
                                                      confirmTextColor:
                                                          Colors.black,
                                                      buttonColor: Colors.white,
                                                      backgroundColor:
                                                          Color(0xFF164f9c),
                                                      title: "تعديل ",
                                                      titleStyle: TextStyle(
                                                          fontSize: 24,
                                                          fontFamily:
                                                              'Cairo-Regular'),
                                                      content: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .car_repair,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 6,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        200],
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(14)),
                                                                  ),
                                                                  width: 240,
                                                                  height: 50,
                                                                  child: GetBuilder<
                                                                          addcopanycontrol>(
                                                                      init:
                                                                          addcopanycontrol(),
                                                                      builder:
                                                                          (controller) =>
                                                                              TextFormField(
                                                                                textAlign: TextAlign.start,
                                                                                textDirection: TextDirection.rtl,
                                                                                validator: (value) {
                                                                                  if (value!.length <= 4) {
                                                                                    return "short company name";
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                                cursorColor: Colors.black87,
                                                                                decoration: InputDecoration(
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.red,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Theme.of(context).primaryColor,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Theme.of(context).primaryColor,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  hintText: " اسم الشركة",
                                                                                  hintStyle: TextStyle(
                                                                                    fontFamily: 'Cairo-Regular',
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                                onChanged: (value) {
                                                                                  controller.compyname = value;
                                                                                },
                                                                              )),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 25,
                                                            ),
                                                            /////////////////////////
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.code,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 6,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        200],
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(14)),
                                                                  ),
                                                                  width: 240,
                                                                  height: 50,
                                                                  child: GetBuilder<
                                                                          addcopanycontrol>(
                                                                      init:
                                                                          addcopanycontrol(),
                                                                      builder:
                                                                          (controller) =>
                                                                              TextFormField(
                                                                                textAlign: TextAlign.start,
                                                                                textDirection: TextDirection.rtl,
                                                                                validator: (value) {
                                                                                  if (value!.length <= 4) {
                                                                                    return "short code";
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                                cursorColor: Colors.black87,
                                                                                decoration: InputDecoration(
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.red,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Theme.of(context).primaryColor,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Theme.of(context).primaryColor,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  hintText: "كود الشركة ",
                                                                                  hintStyle: TextStyle(
                                                                                    fontFamily: 'Cairo-Regular',
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                                onChanged: (value) {
                                                                                  controller.code = value;
                                                                                },
                                                                              )),
                                                                ),
                                                              ],
                                                            ),
                                                          ]));
                                                },
                                                child: Text(
                                                  "تعديل الشركة",
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
                                                      titleStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                      middleText:
                                                          "الشركة مجمدة",
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
                                                      titleStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                      middleText:
                                                          "الشركة غير مجمدة",
                                                      middleTextStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                    );
                                                  }
                                                },
                                                child: Text(
                                                  "حالة الشركة",
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
                          "كود الشركة  " +
                              controller.data[index]["code"].toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<viewcopmanycontroller>(
                            init: viewcopmanycontroller(),
                            builder: (controller) => MaterialButton(
                                color: Colors.blue[600],
                                onPressed: () {
                                  if (controller.data[index]
                                          ["company_director"] ==
                                      null) {
                                    Get.defaultDialog(
                                      backgroundColor: Color(0xFF164f9c),
                                      title: "تحذير ",
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      middleText: "لا يوجد مدير للشركة",
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
                                      content: Column(
                                        children: [
                                          Text(
                                              " اسم مدير الشركة " +
                                                  controller.data[index]
                                                          ["company_director"]
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
                                              "هاتف مدير الشركة   " +
                                                  controller.data[index]
                                                          ["company_director"]
                                                          ["mobile"]
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[200],
                                                  fontFamily: 'Cairo-Regular')),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              freezpress == false
                                                  ? MaterialButton(
                                                      color:
                                                          Colors.redAccent[400],
                                                      onPressed: () {
                                                        freezpress =
                                                            !freezpress;

                                                        controller.id =
                                                            controller
                                                                    .data[index]
                                                                ['id'];
                                                        unfrezzcompconn();
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "الغاء التجميد",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall,
                                                      ),
                                                    )
                                                  : MaterialButton(
                                                      color:
                                                          Colors.lightBlue[400],
                                                      onPressed: () {
                                                        freezpress =
                                                            !freezpress;
                                                        controller.id =
                                                            controller
                                                                    .data[index]
                                                                ['id'];
                                                        frezzcompconn();
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "تجميد  الشركة",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall,
                                                      ),
                                                    ),
                                            ],
                                          )
                                        ],
                                      ),
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
