import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/home/detailesfoecaruserselected.dart';
import 'package:car_x/view/sell/detailesfoecarsellselected.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class forsell extends StatelessWidget {
  const forsell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<getallsellcarcontroller>(
      init: getallsellcarcontroller(),
      builder: (controller) {
        return RefreshIndicator(
            onRefresh: () => controller.getallsellcars(),
            child: ListView.builder(
              itemCount: controller.car.length,
              itemBuilder: (BuildContext context, int index) {
                controller.imagecar = controller.data[index]['image_car'];
                return GestureDetector(
                  onTap: () {
                    controller.detaildata = controller.data[index];
                    controller.imagecardetail =
                        controller.detaildata['image_car'];

                    Get.to(() => carselldetailsforemplo());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.maxFinite,
                    height: 180,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    controller.data[index]['name'],
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Color(0xFF050505),
                                        fontSize: 25,
                                        fontFamily: 'Cairo-Regular'),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 14, bottom: 10),
                                  child: Text(
                                    controller.data[index]['price'].toString() +
                                        (' ل.س'),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontFamily: 'Cairo-Regular'),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 177,
                            width: 180,
                            child: CarouselSlider.builder(
                                itemCount: controller.imagecar.length,
                                itemBuilder: (context, index, rindex) {
                                  return Container(
                                      child: Image.network(
                                    "${ApiConfig.baseUrl}/images/CarPictures/" +
                                        (controller.imagecar[index]['imageName']
                                            .toString()),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.low,
                                  ));
                                },
                                options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1.2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
      },
    );
    ;
  }
}

class getallsellcarcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken");

    super.onInit();
    update();
    getallsellcars();
    update();
  }

  var imagename;
  var id;
  var token;
  var data;
  List car = [];
  List imagecar = [];
  List imagecardetail = [];
  var detaildata;
  Future getallsellcars() async {
    update();
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Car/getAllForSelling');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });

    var status = response.statusCode;
    data = json.decode(response.body);

    if (status == 200) {
      car = data;
      if (kDebugMode) debugPrint(car);
    }
  }
}
