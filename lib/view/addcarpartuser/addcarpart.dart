import 'package:car_x/view/addcarpartuser/addcarpartconn.dart';
import 'package:car_x/view/addcarpartuser/addcarpartcontroller.dart';
import 'package:car_x/view/addcarpartuser/carpartview/seaxhcarpart.dart';

import 'package:car_x/view/addcarpartuser/carpartview/viewidetalicarpart.dart';
import 'package:car_x/view/addcarpartuser/order/viewmisscarpart.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class addcarpartuserpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF164f9c),
        onPressed: () {
          Get.to(() => viewcarpaart());
        },
        label: Text(
          "عرض جميع القطع",
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontFamily: 'Cairo-Regular'),
        ),
      ),
      body: GetBuilder<addcarpartusercontrol>(
          init: addcarpartusercontrol(),
          builder: (controller) {
            return ListView(children: [
              Form(
                  key: controller.keycarpartuser,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Theme.of(context).primaryColor,
                          elevation: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 240,
                                child: IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "اختر من المعرض ",
                                        titleStyle: const TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 24,
                                            fontFamily: 'Cairo-Regular'),
                                        content: IconButton(
                                            onPressed: () {
                                              controller.uploadPhoto();
                                            },
                                            iconSize: 122,
                                            icon: LottieBuilder.asset(
                                              "assets/images/5704-choose-photo.json",
                                            )));
                                  },
                                  icon: LottieBuilder.asset(
                                    "assets/images/60265-digital-camera.json",
                                    width: 170,
                                  ),
                                ),
                              ),
                              const Text(
                                "اضف صور",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 24,
                                    fontFamily: 'Cairo-Regular'),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),

                        ////////////////////////////username
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarpartusercontrol>(
                              init: addcarpartusercontrol(),
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 4) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/icons8-gear-48.png",
                                        scale: 2,
                                      ),
                                      iconColor: Theme.of(context).primaryColor,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "اسم القطعة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.partName = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),

                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarpartusercontrol>(
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/icons8-ipq-64.png",
                                        scale: 2,
                                      ),
                                      iconColor: Theme.of(context).primaryColor,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "كمية القطع",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.Quantity = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarpartusercontrol>(
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 3) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/country.png",
                                        scale: 2.7,
                                      ),
                                      iconColor: Theme.of(context).primaryColor,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "بلد الصنع",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.manufacturingCountry = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarpartusercontrol>(
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 3) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/icons8-price-16.png",
                                        scale: 0.6,
                                      ),
                                      iconColor: Theme.of(context).primaryColor,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: "سعر القطعة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.partPrice = value;
                                    },
                                  )),
                        ),

                        SizedBox(
                          height: 14,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            controller.checkaddcar();
                            uplodeimagepartuserconn();
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              width: 200,
                              height: 60,
                              child: Text("اضف القطعة ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Cairo-Regular'))),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            Get.to(() => viewimagecarpartuser());
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              width: 200,
                              height: 60,
                              child: Text("عرض القطع ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontFamily: 'Cairo-Regular'))),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            Get.to(() => viewallmisscarpart());
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              width: 200,
                              height: 60,
                              child: Text(" عرض القطع المفقودة ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo-Regular'))),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ])),
            ]);
          }),
    );
  }
}
