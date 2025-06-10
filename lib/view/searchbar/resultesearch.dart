import 'package:car_x/view/searchbar/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class resultsearch extends StatelessWidget {
  searchbar controller = Get.put(
    searchbar(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.data == null
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا توجد نتائج للعرض",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF313030),
                        fontSize: 25,
                        fontFamily: 'Cairo-Regular'),
                  ),
                  LottieBuilder.asset(
                    'assets/images/94303-failed.json',
                    repeat: false,
                    width: 100,
                  )
                ],
              ))
            : RefreshIndicator(
                onRefresh: () => controller.searchconn(),
                child: ListView.builder(
                    itemCount: controller.car.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CarouselSlider.builder(
                              itemCount:
                                  controller.data[index]['image_car'].length,
                              itemBuilder: (context, index, rindex) {
                                return Container(
                                    child: Image.network(
                                  "http://10.0.2.2:8000/images/CarPictures/${controller.data[rindex]['image_car'][rindex]['imageName']}",
                                  fit: BoxFit.fill,
                                ));
                              },
                              options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1.2)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.data[index]['model'],
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
                                          controller.data[index]['name'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.data[index]['color'],
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
                                          controller.data[index]
                                                  ['manufacturingYear']
                                              .toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.data[index]['mileage']
                                              .toString(),
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
                                          controller.data[index]
                                                  ['engineCapacity']
                                              .toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          ' غيار ' +
                                              controller.data[index]
                                                      ['motionVector']
                                                  .toString(),
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
                                          controller.data[index]['city']
                                              .toString(),
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
                                  margin:
                                      EdgeInsets.only(right: 40, bottom: 10),
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
                                        controller.data[index]['describe'],
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
                      );
                    }),
              ));
  }
}
