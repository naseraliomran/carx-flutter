import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:car_x/view/requestment/requestment.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewavworkshop extends StatelessWidget {
  getallmentreqcontroller controller2 = Get.put(
    getallmentreqcontroller(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<viewavworkshops>(
          init: viewavworkshops(),
          builder: (controller) => RefreshIndicator(
              onRefresh: () => controller.viewavworkshop(),
              child: controller.data.isEmpty
                  ? Center(
                      child: Text('لا توجد ورشات حاليا',
                          style: TextStyle(
                            fontFamily: 'Cairo-Regular',
                            fontSize: 26,
                          )),
                    )
                  : ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                  margin: EdgeInsets.all(16),
                                  color: Theme.of(context).primaryColor,
                                  elevation: 6,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 40),
                                            child: Text(
                                              "اسم الورشة " +
                                                  controller.data['$index']
                                                          ["name"]
                                                      .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "هاتف الورشة " +
                                          controller.data['$index']["phone"]
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "المسافة" +
                                            controller.data['$index']
                                                    ['distance']
                                                .toString(),
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[200],
                                            fontFamily: 'Cairo-Regular')),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        controller2.woid =
                                            controller.data['$index']['id'];
                                        Get.defaultDialog(
                                            confirm: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(30.0),
                                                  ),
                                                ),
                                                child: MaterialButton(
                                                  child: Text("تاكيد",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF000000),
                                                          fontSize: 28,
                                                          fontFamily:
                                                              'Cairo-Regular')),
                                                  onPressed: () {
                                                    controller2.sendreqconn();
                                                    Get.back();
                                                  },
                                                )),
                                            confirmTextColor: Colors.black,
                                            buttonColor: Colors.white,
                                            backgroundColor: Color(0xFF164f9c),
                                            title: "ارسال الطلب ",
                                            titleStyle: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Cairo-Regular'),
                                            content: Column(children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.car_repair,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    14)),
                                                      ),
                                                      width: 240,
                                                      height: 50,
                                                      child: TextFormField(
                                                        textAlign:
                                                            TextAlign.start,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        cursorColor:
                                                            Colors.black87,
                                                        decoration:
                                                            InputDecoration(
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
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
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          hintText: " الوصف  ",
                                                          hintStyle: TextStyle(
                                                            fontFamily:
                                                                'Cairo-Regular',
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          controller2
                                                                  .description =
                                                              value;
                                                        },
                                                      )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              /////////////////////////
                                            ]));
                                      },
                                      child: Container(
                                          alignment:
                                              AlignmentDirectional.center,
                                          width: 60,
                                          height: 50,
                                          child: Icon(Icons.search)),
                                    )
                                  ])),
                            ]);
                      }))),
    );
  }
}

class viewavworkshops extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    await viewavworkshop();
    update();
    if (kDebugMode) debugPrint(token);
    super.onInit();
  }

  var description = '';
  var token;
  Map data = {};
  var id;

  List reeq = [];

  Future viewavworkshop() async {
    var url =
        Uri.parse('${ApiConfig.baseUrl}/api/Customer/Maintenance/getWorkShops');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;

    if (status == 200) {
      if (response.body.toString().contains('no')) {
      } else {
        data = json.decode(response.body);
        if (kDebugMode) debugPrint(data);
      }
      update();
    }
  }
}
