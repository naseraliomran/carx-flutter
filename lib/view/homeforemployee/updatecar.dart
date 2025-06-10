import 'package:car_x/view/homeforemployee/updatecarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class updatecar extends StatelessWidget {
  updatecar({Key? key}) : super(key: key);
  updatecarcontroller controller = Get.put(
    updatecarcontroller(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: controller.keycarupdate,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                LottieBuilder.asset(
                  'assets/images/lf30_editor_13j7sry5.json',
                  width: 100,
                  repeat: false,
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  width: 240,
                  height: 60,
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                "assets/images/icons8-plus-1-year-50.png",
                                scale: 1.6,
                              ),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                "assets/images/icons8-color-64.png",
                                scale: 2.5,
                              ),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                scale: 0.7,
                              ),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                "assets/images/icons8-odometer-50.png",
                                scale: 2,
                              ),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                                "assets/images/icons8-gear-48.png",
                                scale: 2,
                              ),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  child: GetBuilder<updatecarcontroller>(
                      init: updatecarcontroller(),
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
                              prefixIcon: const Icon(Icons.description),
                              iconColor: Theme.of(context).primaryColor,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
                  height: 12,
                ),
                SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    controller.checkaddcarupdate();
                    controller.updatecarconn();
                  },
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 200,
                      height: 60,
                      child: Text("تعديل السيارة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'Cairo-Regular'))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
