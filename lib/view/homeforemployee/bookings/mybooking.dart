import 'package:car_x/view/home/bookings/book.dart';
import 'package:car_x/view/homeforemployee/bookings/bookemp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class mybookingemploo extends StatelessWidget {
  bookingemploo controller = Get.put(
    bookingemploo(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: controller.soldbookingemploo,
      child: ListView.builder(
        itemCount: controller.item.length,
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
                  LottieBuilder.asset(
                    'assets/images/68986-car-aprroved.json',
                    animate: false,
                    width: 60,
                  ),
                  Text(
                    "تفاصيل السيارة",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3D3D),
                        fontSize: 25,
                        fontFamily: 'Cairo-Regular'),
                    textAlign: TextAlign.right,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            controller.data[index]['manufacturingYear']
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
                            controller.data[index]['mileage'].toString(),
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
                            controller.data[index]['engineCapacity'].toString(),
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
                                controller.data[index]['motionVector']
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
                            controller.data[index]['city'].toString(),
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
                          textAlign: TextAlign.center,
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
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 18,
                              fontFamily: 'Cairo-Regular'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                          color: Colors.red,
                          onPressed: () {
                            controller.id = controller.data[index]['id'];
                            controller.rejectreqemploo();
                          },
                          child: Text(
                            'رفض الحجز',
                            style: TextStyle(
                                color: Color(0xFFFFFCFC),
                                fontSize: 20,
                                fontFamily: 'Cairo-Regular'),
                          )),
                      MaterialButton(
                          color: Color(0xFF164f9c),
                          onPressed: () {
                            controller.id = controller.data[index]['id'];
                            controller.conformreqemploo();
                          },
                          child: Text(
                            'تأكيد الحجز ',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 20,
                                fontFamily: 'Cairo-Regular'),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
