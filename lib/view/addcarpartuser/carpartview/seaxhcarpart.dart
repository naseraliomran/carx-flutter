import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:car_x/view/addcarpartuser/carpartview/search.dart';
import 'package:car_x/view/addcarpartuser/carpartview/ser.dart';
import 'package:car_x/view/addcarpartuser/order/viewmisscarpart.dart';
import 'package:car_x/view/addcarpartuser/order/viewmyorder.dart';
import 'package:car_x/view/searchbar/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:car_x/view/addcarpartuser/carpartview/updatecarpart.dart';
import 'package:flutter/material.dart';

class viewcarpaart extends StatelessWidget {
  getallmisscarpart controller3 = Get.put(
    getallmisscarpart(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.to(() => viewmyorder());
            },
            label: Text(
              'طلباتي للقطع',
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontFamily: 'Cairo-Regular'),
            )),
        body: GetBuilder<carpart>(
            init: carpart(),
            builder: (controller22) => RefreshIndicator(
                onRefresh: () => controller22.getallcarspaaartuser(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 240,
                            height: 50,
                            child: TextField(
                              onTap: () {
                                Get.to(() => searchpart());
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                prefixIconColor: Theme.of(context).primaryColor,
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
                                hintText: '        ابحث عن القطعة      ',
                                hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular', fontSize: 14),
                              ),
                            )),
                        LottieBuilder.asset(
                          'assets/images/98877-search.json',
                          width: 50,
                        ),
                      ],
                    ),
                    Flexible(
                        child: ListView.builder(
                            itemCount: controller22.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.all(14),
                                child: Card(
                                  color: Color(0xFF164f9c),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                              "${ApiConfig.baseUrl}/images/CarPartsPictures/" +
                                                  (controller22.data[index]
                                                          ['imagPart']
                                                      .toString()))),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                iconSize: 33,
                                                onPressed: () {
                                                  controller22.id = controller22
                                                      .data[index]['id'];
                                                  Get.defaultDialog(
                                                      backgroundColor:
                                                          Color(0xFF164f9c),
                                                      title: "التفاصيل ",
                                                      titleStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                      content:
                                                          Column(children: [
                                                        Text(
                                                          'اسم القطعة : ' +
                                                              controller22
                                                                  .data[index][
                                                                      'partName']
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
                                                        SizedBox(
                                                          height: 16,
                                                        ),
                                                        Text(
                                                          'المنشأ  : ' +
                                                              controller22
                                                                  .data[index][
                                                                      'manufacturingCountry']
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
                                                        SizedBox(
                                                          height: 16,
                                                        ),
                                                        Text(
                                                          'السعر : ' +
                                                              controller22
                                                                  .data[index][
                                                                      'partPrice']
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
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Text(
                                                          'رقم الهاتف  : 0937485194',
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFFFFFF),
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Cairo-Regular'),
                                                        ),
                                                        SizedBox(
                                                          height: 16,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .blue[400],
                                                          ),
                                                          onPressed: () {
                                                            controller3
                                                                    .carpartid =
                                                                controller22
                                                                        .data[
                                                                    index]['id'];
                                                            controller3
                                                                    .storeid =
                                                                controller22.data[
                                                                        index]
                                                                    ['storeID'];

                                                            controller3
                                                                .sendorder();
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .center,
                                                              width: 200,
                                                              height: 50,
                                                              child: Text(
                                                                  " طلب القطعة   ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
                                                                      fontFamily:
                                                                          'Cairo-Regular'))),
                                                        ),
                                                      ]));
                                                },
                                                icon: Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey[100],
                                                )),
                                            Text('التفاصيل',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cairo-Regular'))
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ],
                ))));
  }
}

class carpart extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    await getallcarspaaartuser();
    super.onInit();
  }

  @override
  void onReady() async {
    await getallcarspaaartuser();
    update();
    super.onReady();
  }

  var search = "";
  var year = "";
  var from = "";
  var to = "";
  var id;
  var token;
  List data = [];
  List data2 = [];

  getallcarspaaartuser() async {
    Future.delayed(Duration(seconds: 2));
    var url = Uri.parse('${ApiConfig.baseUrl}/api/User/Parts/viewAllPartsCar');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var status = response.statusCode;
    data = json.decode(response.body);
    if (kDebugMode) debugPrint(data);
    update();
  }

  List car = [];
  searchpart() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/User/Parts/filtering');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'partName': search,
      'manufacturingCountry': year,
      'pricefrom': from,
      'priceto': to
    });
    var status = response.statusCode;
    data2 = json.decode(response.body);
    if (response.body.toString().contains('not')) {
      if (kDebugMode) debugPrint('--------');
    } else {
      car = json.decode(response.body)[0]['imagPart'];
    }
    if (kDebugMode) debugPrint(data2);
    update();
  }
}
