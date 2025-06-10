import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/homeforemployee/deletecar.dart';
import 'package:car_x/view/homeforemployee/rentcar.dart';
import 'package:car_x/view/homeforemployee/sellcar.dart';
import 'package:car_x/view/homeforemployee/updatecar.dart';
import 'package:car_x/view/homeforemployee/updatecarcontroller.dart';
import 'package:car_x/view/sell%20copy/forsell%20copy.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class carrentdetailsforuser extends StatelessWidget {
  getallrentscarcontroller controller = Get.put(
    getallrentscarcontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CarouselSlider.builder(
            itemCount: controller.imagecardetail.length,
            itemBuilder: (context, index, rindex) {
              return Container(
                  child: Image.network(
                "${ApiConfig.baseUrl}/images/CarPictures/" +
                    (controller.detaildata['image_car'][index]['imageName']
                        .toString()),
                fit: BoxFit.cover,
              ));
            },
            options: CarouselOptions(
                enableInfiniteScroll: false, viewportFraction: 1.2)),
        Container(
          margin: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "تفاصيل السيارة",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D3D3D),
                    fontSize: 25,
                    fontFamily: 'Cairo-Regular'),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        Card(
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        controller.detaildata['model'],
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/external-car-model-modeling-others-pike-picture.png',
                        width: 50,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        controller.detaildata['name'],
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/car.png',
                        scale: 2,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        controller.detaildata['color'],
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/icons8-color-64.png',
                        width: 50,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        controller.detaildata['manufacturingYear'].toString(),
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/icons8-plus-1-year-50.png',
                        width: 40,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        controller.detaildata['mileage'].toString(),
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/icons8-odometer-50.png',
                        width: 50,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        controller.detaildata['engineCapacity'].toString(),
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/icons8-engine-48.png',
                        width: 50,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        ' غيار ' +
                            controller.detaildata['motionVector'].toString(),
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/icons8-transmission-64.png',
                        width: 50,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        controller.detaildata['city'].toString(),
                        style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 20,
                            fontFamily: 'Cairo-Regular'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/country.png',
                        width: 40,
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 40, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "المواصفات",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D3D3D),
                          fontSize: 22,
                          fontFamily: 'Cairo-Regular'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      controller.detaildata['describe'],
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 18,
                          fontFamily: 'Cairo-Regular'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
