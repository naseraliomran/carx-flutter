import 'package:car_x/view/workshop/mapment.dart';
import 'package:car_x/view/workshop/mentview.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class conform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<getallmentcontroller>(
            init: getallmentcontroller(),
            builder: (controller) => ListView.builder(
                itemCount: 2,
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
                              ]),
                            ))
                      ]);
                })));
  }
}

class getallconformcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("worktoken");
    getallconformconn();
    print(token);
    super.onInit();
  }

  var token;
  var data;
  var lat;
  var long;
  var id;
  List requ = [];
  Future getallconformconn() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/WorkShop/Maintenance/getMyConfirmedRequest');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data = json.decode(response.body);
    if (status == 200) {
      if (data.toString().contains('no')) {
      } else {
        requ = data;
      }

      print(data);
      update();
    }
  }
}
