import 'package:car_x/view/home/bookings/book.dart';
import 'package:car_x/view/home/getallmycar.dart';
import 'package:car_x/view/home/getallusercars.dart';
import 'package:car_x/view/home/loved.dart';
import 'package:car_x/view/homeforemployee/deletecar.dart';
import 'package:car_x/view/homeforemployee/rentcar.dart';
import 'package:car_x/view/homeforemployee/sellcar.dart';
import 'package:car_x/view/homeforemployee/updatecarcontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class cardetailsforuser extends StatefulWidget {
  @override
  State<cardetailsforuser> createState() => _cardetailsforuserState();
}

class _cardetailsforuserState extends State<cardetailsforuser> {
  bool isliked = false;

  booking book = Get.put(
    booking(),
  );
  getallcarusercontroller controller = Get.put(
    getallcarusercontroller(),
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
                fit: BoxFit.cover,
              ));
            },
            options: CarouselOptions(
                enableInfiniteScroll: false, viewportFraction: 1.2)),
        Container(
          margin: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LikeButton(
                onTap: (isliked) async {
                  controller.loveid = controller.detaildata['id'];

                  this.isliked = !isliked;
                  loved();

                  return !isliked;
                },
              ),
              Row(
                children: [
                  controller.detaildata['state'] == 1
                      ? Text('(للبيع)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3D3D3D),
                              fontSize: 18,
                              fontFamily: 'Cairo-Regular'))
                      : Text('(للإجار)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3D3D3D),
                              fontSize: 18,
                              fontFamily: 'Cairo-Regular')),
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
        SizedBox(
          height: 40,
        ),
        controller.detaildata['carMode'] == 1
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
                  controller.detaildata['isBooking'] == 0
                      ? MaterialButton(
                          color: Color(0xFF164f9c),
                          onPressed: () {
                            book.ispress = !book.ispress;
                            setState(() {});

                            book.id = controller.detaildata['id'];
                            book.sendbooking();
                          },
                          child: Text(
                            'حجز السيارة',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 20,
                                fontFamily: 'Cairo-Regular'),
                          ))
                      : Text(
                          'السيارة غير متاحة',
                          style: TextStyle(
                              color: Color(0xFFD23030),
                              fontSize: 28,
                              fontFamily: 'Cairo-Regular'),
                        )
                ],
              ),
        SizedBox(
          height: 40,
        ),
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                  titleStyle: TextStyle(
                      color: Color(0xFF080808),
                      fontSize: 28,
                      fontFamily: 'Cairo-Regular'),
                  title: 'للتواصل',
                  content: Text(
                    'رقم الهاتف   0954276291',
                    style: TextStyle(
                        color: Color(0xFF383838),
                        fontSize: 20,
                        fontFamily: 'Cairo-Regular'),
                  ));
            },
            icon: Icon(
              Icons.phone,
              size: 40,
            ))
      ]),
    ));
  }
}
