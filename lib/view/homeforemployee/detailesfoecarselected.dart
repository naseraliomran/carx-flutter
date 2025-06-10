import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:car_x/view/homeforemployee/bookings/bookemp.dart';
import 'package:car_x/view/homeforemployee/deletecar.dart';
import 'package:car_x/view/homeforemployee/rentcar.dart';
import 'package:car_x/view/homeforemployee/sellcar.dart';
import 'package:car_x/view/homeforemployee/updatecar.dart';
import 'package:car_x/view/homeforemployee/updatecarcontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardetailsforemplo extends StatefulWidget {
  cardetailsforemplo({Key? key}) : super(key: key);

  @override
  State<cardetailsforemplo> createState() => _cardetailsforemploState();
}

class _cardetailsforemploState extends State<cardetailsforemplo> {
  getallcarcontroller controller = Get.put(
    getallcarcontroller(),
  );

  deletecar controller1 = Get.put(
    deletecar(),
  );

  updatecarcontroller controller2 = Get.put(
    updatecarcontroller(),
  );

  sellcar controller3 = Get.put(
    sellcar(),
  );

  rentcar controller4 = Get.put(
    rentcar(),
  );

  bookingemploo controller5 = Get.put(
    bookingemploo(),
  );

  var ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: controller.imagecardetail.length,
              itemBuilder: (context, index, rindex) {
                return Container(
                    child: Image.network(
                  "http://10.0.2.2:8000/images/CarPictures/" +
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
                Row(
                  children: [
                    controller.detaildata['state'] == 0
                        ? Text(
                            '(للإجار)',
                            style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 18,
                                fontFamily: 'Cairo-Regular'),
                          )
                        : Text(''),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          ' غيار ' +
                              controller.detaildata['motionVector'].toString(),
                          style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 18,
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
          controller.detaildata['carMode'] == 1 ||
                  controller.detaildata['isBooking'] == 1
              ? Text(
                  'السيارة غير متاحة',
                  style: TextStyle(
                      color: Color(0xFFD23030),
                      fontSize: 28,
                      fontFamily: 'Cairo-Regular'),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          controller.id =
                              controller.detaildata['id'].toString();
                          Get.defaultDialog(
                              backgroundColor: Color(0xFF164f9c),
                              title: "تحذير ",
                              titleStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              middleTextStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              middleText: "هل انت متاكد من العملية؟",
                              onConfirm: () {
                                controller1.deletecarconn();
                              },
                              confirmTextColor: Colors.white,
                              buttonColor: Colors.red,
                              textConfirm: "تاكيد");
                        },
                        child: Text(
                          'حذف السيارةٍ',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        )),
                    MaterialButton(
                        color: Color(0xFF164f9c),
                        onPressed: () {
                          controller2.id = controller.detaildata['id'];
                          Get.to(() => updatecar());
                        },
                        child: Text(
                          'تعديل السيارة',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        )),
                  ],
                ),
          controller.detaildata['carMode'] == 1 ||
                  controller.detaildata['isBooking'] == 1
              ? Text("")
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                        color: Color(0xFF164f9c),
                        onPressed: () {
                          controller3.id = controller.detaildata['id'];
                          Get.to(() => sellcars());
                        },
                        child: Text(
                          ' بيع السيارة',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        )),
                    MaterialButton(
                        color: Color(0xFF164f9c),
                        onPressed: () {
                          controller4.id = controller.detaildata['id'];
                          Get.to(() => rentcars());
                        },
                        child: Text(
                          'تأجير السيارة',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        )),
                  ],
                ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    ));
  }
}
