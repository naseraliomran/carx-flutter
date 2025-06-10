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
import 'package:car_x/view/searchbar/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

load() async {
  await Get.find<getallcarusercontroller>().getallcarsuser();
}

hometab controller1 = Get.put(
  hometab(),
);
final NumberFormat usCurrency = NumberFormat('#,##0', 'ar');

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            heroTag: Text('btn1'),
            backgroundColor: const Color(0xFF3377CF),
            onPressed: () {
              Get.to(() => addmycarpage());
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أضف سيارة",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(Icons.add)
              ],
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Row(
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
              SizedBox(
                height: 3,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey[600],
            labelColor: const Color(0xFF164f9c),
            indicatorColor: Colors.orange,
            controller: controller1.con,
            tabs: controller1.tab,
          ),
        ),
        body: TabBarView(controller: controller1.con, children: [
          cars(),
          mycars(),
        ]));
  }

  Widget cars() {
    return GetBuilder<getallcarusercontroller>(
      init: getallcarusercontroller(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: controller.getallcarsuser,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MaterialButton(
                          color: Color(0xFF6786AF),
                          onPressed: () {
                            Get.to(() => rentbooking());
                          },
                          child: Text(
                            'الحجوزات  المؤجرة',
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
                            Get.to(() => soldbooking());
                          },
                          child: Text(
                            'الحجوزات  المباعة',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontFamily: 'Cairo-Regular'),
                          )),
                      SizedBox(
                        width: 9,
                      ),
                      MaterialButton(
                          hoverColor: Colors.amber[300],
                          color: Color(0xFF6786AF),
                          onPressed: () {
                            Get.to(() => mybooking());
                          },
                          child: Text(
                            'حجوزاتي',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontFamily: 'Cairo-Regular'),
                          )),
                    ],
                  ),
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

                        Get.to(() => cardetailsforuser());
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
                                    Row(
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
                                        SizedBox(
                                          width: 18,
                                        ),
                                        controller.data[index]['carMode'] == 1
                                            ? Text(
                                                'غير متوفر',
                                                style: TextStyle(
                                                    color: Colors.red[300],
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'Cairo-Regular'),
                                              )
                                            : Text('')
                                      ],
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
                                        "http://10.0.2.2:8000/images/CarPictures/" +
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
                                  "http://10.0.2.2:8000/images/CarPictures/" +
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
