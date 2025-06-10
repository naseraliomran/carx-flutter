import 'package:car_x/view/cars/image/deletecarimag.dart';
import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewimages extends StatelessWidget {
  getallcarcontroller controller2 = Get.put(getallcarcontroller());

  deleteimagecontroller controller1 = Get.put(deleteimagecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<getallcarcontroller>(
            didUpdateWidget: (oldWidget, state) => getallcarcontroller(),
            init: getallcarcontroller(),
            builder: (controller2) => RefreshIndicator(
                onRefresh: () => controller2.getallcars(),
                child: ListView.builder(
                    itemCount: controller2.imagecar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GetBuilder<getallcarcontroller>(
                          init: getallcarcontroller(),
                          builder: (controller) {
                            return Container(
                              padding: EdgeInsets.all(14),
                              child: Card(
                                color: Colors.red[300],
                                child: Column(
                                  children: [
                                    Container(
                                      child: Image.network(
                                        "http://10.0.2.2:8000/images/CarPictures/" +
                                            (controller2.imagecar[index]
                                                    ['imageName']
                                                .toString()),
                                      ),
                                    ),
                                    IconButton(
                                        iconSize: 33,
                                        onPressed: () {
                                          controller2.id = controller2
                                              .imagecar[index]['idCar']
                                              .toString();
                                          controller2.imagename = controller2
                                              .imagecar[index]['imageName']
                                              .toString();
                                          Get.defaultDialog(
                                              backgroundColor:
                                                  Color(0xFF164f9c),
                                              title: "تحذير ",
                                              titleStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge,
                                              middleTextStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              middleText:
                                                  "هل انت متاكد من العملية؟",
                                              onConfirm: () {
                                                controller1.deleteimageconn();
                                              },
                                              confirmTextColor: Colors.white,
                                              buttonColor: Colors.red,
                                              textConfirm: "تاكيد");
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.grey[100],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    }))));
  }
}
