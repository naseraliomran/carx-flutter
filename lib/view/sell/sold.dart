import 'package:car_x/view/home/detailesfoecaruserselected.dart';
import 'package:car_x/view/sell/detailesfoecarsoldselected.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class sold extends StatelessWidget {
  const sold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<getallsoldcarcontroller>(
      init: getallsoldcarcontroller(),
      builder: (controller) {
        return RefreshIndicator(
            onRefresh: () => controller.getallsoldcars(),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                controller.imagecar = controller.data[index]['image_car'];
                return GestureDetector(
                  onTap: () {
                    controller.detaildata = controller.data[index];
                    controller.imagecardetail =
                        controller.detaildata['image_car'];

                    Get.to(() => carsolddetailsforemplo());
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
                                    "http://10.0.2.2:8000/images/CarPictures/" +
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

class getallsoldcarcontroller extends GetxController {
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("caremptoken");

    super.onInit();
    update();
    getallsoldcars();
    update();
  }

  var imagename;
  var id;
  var token;
  var data = [];
  List car = [];
  List imagecar = [];
  List imagecardetail = [];
  var detaildata;
  Future getallsoldcars() async {
    update();
    var url = Uri.parse('http://10.0.2.2:8000/api/Car/getAllSoldCars');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });

    var status = response.statusCode;
    data = json.decode(response.body);

    if (status == 200) {
      print(data);

      if (data.toString().contains('no')) {
        car = data;
      }
    }
  }
}
