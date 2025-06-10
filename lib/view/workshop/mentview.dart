import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/workshop/conform.dart';
import 'package:car_x/view/workshop/mapment.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class mentview extends StatelessWidget {
  const mentview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue[400],
          onPressed: () {
            Get.to(() => conform());
          },
          label: Text(
            "عرض الطلبات المؤكدة",
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          )),
      body: GetBuilder<getallmentcontroller>(
        init: getallmentcontroller(),
        builder: (controller) => RefreshIndicator(
          onRefresh: () => controller.getallmentconn(),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Mapsample());
                      },
                      child: Card(
                          margin: EdgeInsets.all(16),
                          color: Theme.of(context).primaryColor,
                          elevation: 6,
                          child: Column(
                            children: [
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
                                      "الوصف  " +
                                          controller.data[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.place,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    'الموقع',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textDirection: TextDirection.rtl,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    color: Colors.redAccent[400],
                                    onPressed: () {
                                      controller.cancelementconn();
                                      Get.rawSnackbar(
                                        barBlur: 3,
                                        titleText: Text(
                                          "تمت الغاء الطلب  بنجاح",
                                          style: TextStyle(
                                              color: Color(0xFF2E2E2E),
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
                                    },
                                    child: Text(
                                      "الغاء الطلب",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MaterialButton(
                                    color: Colors.lightBlue[400],
                                    onPressed: () {
                                      controller.confirmmentconn();
                                      Get.rawSnackbar(
                                        barBlur: 3,
                                        titleText: Text(
                                          "تمت أرسال الطلب  بنجاح",
                                          style: TextStyle(
                                              color: Color(0xFF2E2E2E),
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
                                    },
                                    child: Text(
                                      "تأكيد الطلب ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )
                  ]);
            },
          ),
        ),
      ),
    );
  }
}

class getallmentcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("worktoken");
    getallmentconn();
    if (kDebugMode) debugPrint(token);
    super.onInit();
  }

  var token;
  List data = [
    'السيارة لا تعمل',
    'ارتفاع درجة حرارة المحرك',
    'عطل مفاجئ',
    'لا يوجد طاقة في السيارة'
  ];

  var id;
  var data1;
  var data2;
  List req = [];
  Future getallmentconn() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/api/WorkShop/Maintenance/getAllMaintenanceRequest');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data = json.decode(response.body);
    if (status == 200) {
      if (kDebugMode) debugPrint(data);
      update();
    }
  }

  Future confirmmentconn() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/api/WorkShop/Maintenance/confirmRequest/$id');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    data1 = json.decode(response.body);
  }

  Future cancelementconn() async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/api/WorkShop/Maintenance/cancellationRequest/$id');
    var response = await http.put(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data2 = json.decode(response.body);
    if (status == 200) {
      if (kDebugMode) debugPrint(data2);
      update();
    }
  }
}
