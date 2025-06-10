import 'package:car_x/view/home/bookings/book.dart';
import 'package:car_x/view/homeforemployee/bookings/bookemp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class rentbookingemploo extends StatelessWidget {
  bookingemploo controller = Get.put(
    bookingemploo(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: controller.rentbookingemploo,
      child: controller.data1.toString().contains('no')
          ? Center(
              child: Text(
              'لا توجد حجوزات',
              style: TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 20,
                  fontFamily: 'Cairo-Regular'),
            ))
          : ListView.builder(
              itemCount: controller.item1.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
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
                                  controller.data1[index]['model'],
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
                                  controller.data1[index]['name'],
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
                                  controller.data1[index]['color'],
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
                                  controller.data1[index]['manufacturingYear']
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.data1[index]['mileage'].toString(),
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
                                  controller.data1[index]['engineCapacity']
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' غيار ' +
                                      controller.data1[index]['motionVector']
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
                                  controller.data1[index]['city'].toString(),
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
                                controller.data1[index]['describe'],
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
                );
              },
            ),
    ));
  }
}
