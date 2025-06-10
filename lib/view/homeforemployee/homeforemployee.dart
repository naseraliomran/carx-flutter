import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:car_x/view/homeforemployee/bookings/mybooking.dart';
import 'package:car_x/view/homeforemployee/bookings/rentbooking.dart';
import 'package:car_x/view/homeforemployee/bookings/soldbook.dart';
import 'package:car_x/view/homeforemployee/detailesfoecarselected.dart';
import 'package:car_x/view/searchbar/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

searchbar controller1 = Get.put(
  searchbar(),
);
final NumberFormat usCurrency = NumberFormat('#,##0', 'ar');

class Homepageforemployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 240,
                height: 50,
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
                    hintStyle:
                        TextStyle(fontFamily: 'Cairo-Regular', fontSize: 16),
                  ),
                  onTap: () {
                    Get.to(() => search());
                  },
                )),
            Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/hatla2ee_logo_new.png',
                scale: 1.5,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 10,
          thickness: 1,
          color: Colors.grey,
        ),
        Flexible(child: cars()),
      ],
    ));
  }

  Widget cars() {
    return GetBuilder<getallcarcontroller>(
      init: getallcarcontroller(),
      builder: (controller) {
        return RefreshIndicator(
            onRefresh: () => controller.getallcars(),
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(
                        color: Color(0xFF6786AF),
                        onPressed: () {
                          Get.to(() => rentbookingemploo());
                        },
                        child: Text(
                          'حجوزات السيارات المؤجرة',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontFamily: 'Cairo-Regular'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        color: Color(0xFF6786AF),
                        onPressed: () {
                          Get.to(() => soldbookingemploo());
                        },
                        child: Text(
                          'حجوزات السيارات المباعة',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontFamily: 'Cairo-Regular'),
                        )),
                    SizedBox(
                      width: 9,
                    ),
                  ],
                ),
              ),
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

                      Get.to(() => cardetailsforemplo());
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
                                    margin: EdgeInsets.only(left: 70),
                                    child: Text(
                                      controller.data[index]['name'] +
                                          ' ' +
                                          controller.data[index]['model'],
                                      style: TextStyle(
                                          color: Color(0xFF050505),
                                          fontSize: 24,
                                          fontFamily: 'Cairo-Regular'),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 14, bottom: 10),
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
                                      "http://10.0.2.2:8000/images/CarPictures/" +
                                          (controller.imagecar[index]
                                                  ['imageName']
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
              ))
            ]));
      },
    );
  }
}
