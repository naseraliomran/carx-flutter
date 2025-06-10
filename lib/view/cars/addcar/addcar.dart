import 'dart:io';
import 'package:car_x/view/cars/addcar/addcarconn.dart';
import 'package:car_x/view/cars/addcar/addcarcontroller.dart';
import 'package:car_x/view/cars/image/getallcars.dart';
import 'package:car_x/view/cars/image/uplodecarimage.dart';
import 'package:car_x/view/cars/image/viewimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class addcarpage extends StatefulWidget {
  @override
  State<addcarpage> createState() => _addcarpageState();
}

class _addcarpageState extends State<addcarpage> {
  uplodimagecontroller controller1 = Get.put(
    uplodimagecontroller(),
  );
  addcarcontrol controller = Get.put(
    addcarcontrol(),
  );
  getallcarcontroller controller2 = Get.put(
    getallcarcontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3377CF),
        onPressed: () {
          Get.to(() => viewimages());
          controller2.getallcars();
        },
        child: const Icon(Icons.image),
      ),
      body: GetBuilder<addcarcontrol>(
          init: addcarcontrol(),
          builder: (controller) {
            return ListView(children: [
              Form(
                  key: controller.keycar,
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
                                        content: Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.uploadPhoto();
                                                },
                                                iconSize: 122,
                                                icon: LottieBuilder.asset(
                                                  "assets/images/5704-choose-photo.json",
                                                )),
                                          ],
                                        ));
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
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 2) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/car.png",
                                        scale: 2.5,
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
                                      hintText: "نوع السيارة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.name = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),

                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 2) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/external-car-model-modeling-others-pike-picture.png",
                                        width: 12,
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
                                      hintText: "موديل السيارة ",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.model = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    keyboardType: TextInputType.number,
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
                                        "assets/images/icons8-plus-1-year-50.png",
                                        scale: 1.6,
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
                                      hintText: " سنة الصنع ",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.manufacturingYear = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
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
                                        "assets/images/icons8-color-64.png",
                                        scale: 2.5,
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
                                      hintText: "لون السيارة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.color = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    keyboardType: TextInputType.number,
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
                                        scale: 0.7,
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
                                      hintText: "سعر السيارة ",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.price = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 2) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.place),
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
                                      hintText: "المحافظة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.city = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    keyboardType: TextInputType.number,
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
                                        "assets/images/icons8-odometer-50.png",
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
                                      hintText: "عداد المسافة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.mileage = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    keyboardType: TextInputType.number,
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
                                      hintText: "سعة المحرك",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.engineCapacity = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 240,
                          height: 60,
                          child: GetBuilder<addcarcontrol>(
                              init: addcarcontrol(),
                              builder: (controller) => TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    validator: (value) {
                                      if (value!.length <= 5) {
                                        return "enter correct information";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.description),
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
                                      hintText: "وصف السيارة",
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Cairo-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.describe = value;
                                    },
                                  )),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "نوع ناقل الحركة",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 66, right: 66),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      controller.motionVector = 'اوتوماتيك';
                                    },
                                    child: Card(
                                      color: Colors.blueGrey[200],
                                      child: Image.asset(
                                          "assets/images/icons8-transmission-64 (1).png"),
                                    ),
                                  ),
                                  const Text(
                                    'اتوماتيك',
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontFamily: 'Cairo-Regular'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      controller.motionVector = 'عادي';
                                    },
                                    child: Card(
                                      color: Colors.blueGrey[200],
                                      child: Image.asset(
                                          "assets/images/icons8-transmission-64.png"),
                                    ),
                                  ),
                                  const Text(
                                    'عادي',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontFamily: 'Cairo-Regular'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "نوع العملية",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'Cairo-Regular'),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 66, right: 66),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        controller.state = 1;
                                      },
                                      child: Card(
                                        color: Colors.blueGrey[200],
                                        child: Image.asset(
                                          "assets/images/icons8-sell-50.png",
                                          color: Colors.grey[800],
                                          width: 64,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'بيع',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontFamily: 'Cairo-Regular'),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        controller.state = 0;
                                      },
                                      child: Card(
                                        color: Colors.blueGrey[200],
                                        child: Image.asset(
                                          "assets/images/icons8-car-rental-50.png",
                                          color: Colors.grey[700],
                                          width: 64,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'اجار',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontFamily: 'Cairo-Regular'),
                                    )
                                  ],
                                )
                              ],
                            )),
                        SizedBox(
                          height: 14,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            controller.checkaddcar();
                            addcarconn();
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              width: 200,
                              height: 60,
                              child: Text("اضف السيارة",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontFamily: 'Cairo-Regular'))),
                        )
                      ])),
            ]);
          }),
    );
  }
}
