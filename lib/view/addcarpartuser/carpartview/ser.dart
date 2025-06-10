import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:car_x/view/addcarpartuser/carpartview/seaxhcarpart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ser extends StatelessWidget {
  const ser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    carpart controller2 = Get.put(
      carpart(),
    );
    return Scaffold(
        body: ListView.builder(
            itemCount: controller2.data2.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(14),
                child: Card(
                  color: Color(0xFF164f9c),
                  child: Column(
                    children: [
                      Container(
                          child: Image.network(
                              "${ApiConfig.baseUrl}/images/CarPartsPictures/" +
                                  (controller2.data2[index]['imagPart']
                                      .toString()))),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                iconSize: 33,
                                onPressed: () {
                                  Get.defaultDialog(
                                      backgroundColor: Color(0xFF164f9c),
                                      title: "التفاصيل ",
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      content: Column(children: [
                                        Text(
                                          'اسم القطعة : ' +
                                              controller2.data2[index]
                                                      ['partName']
                                                  .toString(),
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 20,
                                              fontFamily: 'Cairo-Regular'),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          'المنشأ  : ' +
                                              controller2.data2[index]
                                                      ['manufacturingCountry']
                                                  .toString(),
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 20,
                                              fontFamily: 'Cairo-Regular'),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          'السعر : ' +
                                              controller2.data2[index]
                                                      ['partPrice']
                                                  .toString(),
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 20,
                                              fontFamily: 'Cairo-Regular'),
                                        )
                                      ]));
                                },
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Colors.grey[100],
                                )),
                          ]),
                    ],
                  ),
                ),
              );
            }));
  }
}
