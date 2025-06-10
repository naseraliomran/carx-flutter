import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'dart:convert';
import 'package:car_x/view/addcarpart/carpartview/viwecarpartconn.dart';
import 'package:car_x/view/addcarpartuser/order/viewmyorder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewallmisscarpart extends StatelessWidget {
  getallcarpartcontroller controller2 = Get.put(
    getallcarpartcontroller(),
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
        body: GetBuilder<getallmisscarpart>(
            init: getallmisscarpart(),
            builder: (controller) => RefreshIndicator(
                onRefresh: () => controller.getallmisscarpartconn(),
                child: ListView.builder(
                    itemCount: controller.item.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(14),
                          child: Card(
                              color: Colors.blue[300],
                              child: Column(children: [
                                Container(
                                    child: Image.network(
                                        "${ApiConfig.baseUrl}/images/CarPartsPictures/" +
                                            (controller.data[index]['imagPart']
                                                .toString()))),
                                Column(
                                  children: [
                                    Text(
                                      'اسم القطعة : ' +
                                          controller.data[index]['partName']
                                              .toString(),
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 20,
                                          fontFamily: 'Cairo-Regular'),
                                    ),
                                    Text(
                                      'سعر القطعة : ' +
                                          controller.data[index]['partPrice']
                                              .toString(),
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 20,
                                          fontFamily: 'Cairo-Regular'),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF164f9c),
                                  ),
                                  onPressed: () {
                                    controller.carpartid =
                                        controller.data[index]['id'];
                                    controller.storeid =
                                        controller.data[index]['storeID'];

                                    controller.sendorder();
                                  },
                                  child: Container(
                                      alignment: AlignmentDirectional.center,
                                      width: 100,
                                      height: 40,
                                      child: Text(" طلب القطعة   ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Cairo-Regular'))),
                                ),
                                IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Get.defaultDialog(
                                          titleStyle: TextStyle(
                                              color: Color(0xFF080808),
                                              fontSize: 28,
                                              fontFamily: 'Cairo-Regular'),
                                          title: 'للتواصل',
                                          content: Text(
                                            'رقم الهاتف   0954276291',
                                            style: TextStyle(
                                                color: Color(0xFF383838),
                                                fontSize: 20,
                                                fontFamily: 'Cairo-Regular'),
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.phone,
                                      size: 33,
                                    ))
                              ])));
                    }))));
  }
}

class getallmisscarpart extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    update();
    super.onInit();
  }

  @override
  void onReady() {
    getallmisscarpartconn();
    update();
    super.onReady();
  }

  List item = [];
  var storeid;
  var carpartid;
  var token;
  var data;
  var id;
  Future getallmisscarpartconn() async {
    var url =
        Uri.parse('${ApiConfig.baseUrl}/api/Customer/Order/allMissingCarParts');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    var status = response.statusCode;
    data = json.decode(response.body);
    if (status == 200) {
      item = data;
      if (kDebugMode) debugPrint(data);
      update();
    }
  }

  var data2;
  Future sendorder() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/api/Customer/Order/sendOrder/$carpartid/$storeid');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });

    var status = response.statusCode;
    data2 = json.decode(response.body);
    if (status == 200) {
      if (kDebugMode) debugPrint(data2);
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تمت طلب القطعة بنجاح",
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 26,
              fontFamily: 'Cairo-Regular'),
          textAlign: TextAlign.center,
        ),
        messageText: LottieBuilder.asset(
          "assets/images/7184-done.json",
          width: 170,
          height: 170,
          repeat: false,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
      );
      update();
    }
  }
}
