import 'package:car_x/view/home/caruser/rentcar.dart';
import 'package:car_x/view/home/caruser/sellcar.dart';
import 'package:car_x/view/home/getallmycar.dart';
import 'package:car_x/view/homeforemployee/deletecar.dart';
import 'package:car_x/view/homeforemployee/rentcar.dart';
import 'package:car_x/view/homeforemployee/sellcar.dart';
import 'package:car_x/view/homeforemployee/updatecar.dart';
import 'package:car_x/view/homeforemployee/updatecarcontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardetailsformycar extends StatelessWidget {
  getallmycarcontroller controller = Get.put(
    getallmycarcontroller(),
  );
  deletecar controller1 = Get.put(
    deletecar(),
  );
  updatecarcontroller controller2 = Get.put(
    updatecarcontroller(),
  );
  sellmycar controller3 = Get.put(
    sellmycar(),
  );
  rentmycar controller4 = Get.put(
    rentmycar(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        CarouselSlider.builder(
            itemCount: controller.imagecardetail.length,
            itemBuilder: (context, index, rindex) {
              return Container(
                  child: Image.network(
                "http://10.0.2.2:8000/images/CarPictures/" +
                    (controller.detaildata['image_car'][index]['imageName']
                        .toString()),
                fit: BoxFit.fill,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      controller.id = controller.detaildata['id'].toString();
                      Get.defaultDialog(
                          backgroundColor: Color(0xFF164f9c),
                          title: "تحذير ",
                          titleStyle: Theme.of(context).textTheme.displayLarge,
                          middleTextStyle:
                              Theme.of(context).textTheme.displayMedium,
                          middleText: "هل انت متاكد من العملية؟",
                          onConfirm: () {
                            controller1.deletemycarconn();
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
              ],
            ),
            controller.detaildata['carMode'] == 1
                ? Text(
                    'السيارة',
                    style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 40,
                        fontFamily: 'Cairo-Regular'),
                  )
                : Row(
                    children: [
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
          ],
        ),
        controller.detaildata['carMode'] == 1
            ? Padding(
                padding: const EdgeInsets.only(left: 195),
                child: Text(
                  'غير متوفرة',
                  style: TextStyle(
                      color: Color(0xFF565555),
                      fontSize: 40,
                      fontFamily: 'Cairo-Regular'),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      color: Color(0xFF164f9c),
                      onPressed: () {
                        controller3.id = controller.detaildata['id'];
                        Get.to(() => sellmycars());
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
                        Get.to(() => rentmycars());
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
      ]),
    ));
  }
}
