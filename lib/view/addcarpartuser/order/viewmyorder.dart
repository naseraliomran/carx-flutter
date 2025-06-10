import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewmyorder extends StatelessWidget {
  const viewmyorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<vieworder>(
            didUpdateWidget: (oldWidget, state) => vieworder(),
            init: vieworder(),
            builder: (controller) => RefreshIndicator(
                onRefresh: () => controller.viewmyorderconn(),
                child: controller.data.toString().contains('no')
                    ? Center(
                        child: Text(
                        'لا توجد طلبات للقطع',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 30,
                            fontFamily: 'Cairo-Regular'),
                      ))
                    : ListView.builder(
                        itemCount: controller.part.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: EdgeInsets.all(14),
                              child: Card(
                                  color: Colors.blue[300],
                                  child: Column(children: [
                                    Container(
                                        child: controller.data[index]
                                                    ['car_parts'] ==
                                                null
                                            ? Image.network(
                                                'https://www.gamian.eu/?attachment_id=72')
                                            : Image.network(
                                                "http://10.0.2.2:8000/images/CarPartsPictures/" +
                                                    (controller.data[index]
                                                            ['car_parts']
                                                            ['imagPart']
                                                        .toString()))),
                                    Column(
                                      children: [
                                        controller.data[index]['car_parts'] ==
                                                null
                                            ? Text('data')
                                            : Text(
                                                'اسم القطعة : ' +
                                                    controller.data[index]
                                                            ['car_parts']
                                                            ['partName']
                                                        .toString(),
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cairo-Regular'),
                                              ),
                                        controller.data[index]['car_parts'] ==
                                                null
                                            ? Text('data')
                                            : Text(
                                                'سعر القطعة : ' +
                                                    controller.data[index]
                                                            ['car_parts']
                                                            ['partPrice']
                                                        .toString(),
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cairo-Regular'),
                                              ),
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            onPressed: () {
                                              controller.id =
                                                  controller.data[index]['id'];
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
                                                    controller.deleteorder();
                                                    Get.back();
                                                  },
                                                  confirmTextColor:
                                                      Colors.white,
                                                  buttonColor: Colors.red,
                                                  textConfirm: "تاكيد");
                                            },
                                            child: Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                width: 100,
                                                height: 40,
                                                child: Text("  حذف الطلب   ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Cairo-Regular'))),
                                          ),
                                        ])
                                  ])));
                        }))));
  }
}

class vieworder extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    viewmyorderconn();
    print(token);
    super.onInit();
  }

  var storeid;
  var carpartid;
  var token;
  var data;
  var id;
  List part = [];
  Future viewmyorderconn() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Customer/Order/myOrder');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data = json.decode(response.body);
    if (status == 200) {
      part = data;
      print(data);
      update();
    }
  }

  var data2;
  Future deleteorder() async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/Customer/Order/deleteOrder/$id');
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data2 = json.decode(response.body);
    if (status == 200) {
      Get.rawSnackbar(
        barBlur: 2,
        titleText: Text(
          "تمت عملية الحذف بنجاح",
          style: TextStyle(
              color: Color(0xFFFFFFFF),
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
      print(data2);
      update();
    }
  }
}
