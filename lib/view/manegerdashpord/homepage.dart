import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/home/bookings/mybooking.dart';
import 'package:car_x/view/home/bookings/rentbooking.dart';
import 'package:car_x/view/home/bookings/soldbook.dart';
import 'package:car_x/view/home/caruser/addcar/addcar.dart';
import 'package:car_x/view/home/detailesfoecaruserselected.dart';
import 'package:car_x/view/home/detailesfoemycarselected.dart';
import 'package:car_x/view/home/getallmycar.dart';
import 'package:car_x/view/home/getallusercars.dart';
import 'package:car_x/view/home/loved.dart';
import 'package:car_x/view/home/tab.dart';
import 'package:car_x/view/manegerdashpord/detailesfoecaruserselected.dart';
import 'package:car_x/view/searchbar/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

load() async {
  await Get.find<getallcarusercontroller>().getallcarsuser();
}

final NumberFormat usCurrency = NumberFormat('#,##0', 'ar');

class Homepageman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cars(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 240,
                      height: 40,
                      child: TextField(
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
                          hintText: 'ابحث عن الماركة او الموديل',
                          hintStyle: TextStyle(
                              fontFamily: 'Cairo-Regular', fontSize: 14),
                        ),
                        onTap: () {
                          Get.to(() => search());
                        },
                      )),
                  Image.asset(
                    'assets/images/hatla2ee_logo_new.png',
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cars() {
    return GetBuilder<getallcarusercontroller>(
      init: getallcarusercontroller(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: controller.getallcarsuser,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: controller.car.length,
                  itemBuilder: (BuildContext context, int index) {
                    controller.imagecar = controller.data[index]['image_car'];
                    return GestureDetector(
                      onTap: () {
                        controller.detaildata = controller.data[index];
                        controller.imagecardetail =
                            controller.detaildata['image_car'];

                        Get.to(() => cardetailsforall());
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        controller.data[index]['name'],
                                        style: TextStyle(
                                            color: Color(0xFF050505),
                                            fontSize: 25,
                                            fontFamily: 'Cairo-Regular'),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 14, bottom: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'ل.س  ',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'Cairo-Regular'),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '${usCurrency.format(controller.data[index]['price'])}',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'Cairo-Regular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
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
                                            (controller.imagecar[index]
                                                    ['imageName']
                                                .toString()),
                                        fit: BoxFit.fill,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

mycars() {
  return GetBuilder<getallmycarcontroller>(
    init: getallmycarcontroller(),
    builder: (controller) {
      return RefreshIndicator(
          onRefresh: controller.getallmycarsuser,
          child: ListView.builder(
            itemCount: controller.car.length,
            itemBuilder: (BuildContext context, int index) {
              controller.imagecar = controller.data[index]['image_car'];
              return GestureDetector(
                onTap: () {
                  controller.detaildata = controller.data[index];
                  controller.imagecardetail =
                      controller.detaildata['image_car'];

                  Get.to(() => cardetailsformycar());
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
                                  style: TextStyle(
                                      color: Color(0xFF050505),
                                      fontSize: 25,
                                      fontFamily: 'Cairo-Regular'),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 14, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'ل.س  ',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontFamily: 'Cairo-Regular'),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${usCurrency.format(controller.data[index]['price'])}',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontFamily: 'Cairo-Regular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
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
                                  fit: BoxFit.fill,
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
}
