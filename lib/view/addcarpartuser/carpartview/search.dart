import 'dart:convert';

import 'package:car_x/moudle/admin/frezz.dart';
import 'package:car_x/view/addcarpartuser/carpartview/seaxhcarpart.dart';
import 'package:car_x/view/addcarpartuser/carpartview/ser.dart';
import 'package:car_x/view/searchbar/resultesearch.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class searchpart extends StatelessWidget {
  const searchpart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<carpart>(
      init: carpart(),
      builder: (controller) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/images/98877-search.json',
                width: 140,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: 240,
                  height: 60,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.time_to_leave),
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
                      hintText: "اسم القطعة",
                      hintStyle: const TextStyle(
                        fontFamily: 'Cairo-Regular',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      controller.search = value;
                    },
                  )),
              Text(
                'السعر من -> الى',
                style: TextStyle(
                  fontFamily: 'Cairo-Regular',
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 140,
                      height: 60,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.monetization_on_outlined),
                          iconColor: Theme.of(context).primaryColor,
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
                          hintText: " الى",
                          hintStyle: const TextStyle(
                            fontFamily: 'Cairo-Regular',
                            fontSize: 16,
                          ),
                        ),
                        onChanged: (value) {
                          controller.to = value;
                        },
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                      width: 140,
                      height: 60,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.monetization_on),
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
                          hintText: "من",
                          hintStyle: const TextStyle(
                            fontFamily: 'Cairo-Regular',
                            fontSize: 16,
                          ),
                        ),
                        onChanged: (value) {
                          controller.from = value;
                        },
                      )),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  width: 240,
                  height: 60,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.precision_manufacturing),
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
                      hintText: "بلد المنشأ",
                      hintStyle: const TextStyle(
                        fontFamily: 'Cairo-Regular',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      if (value == null) {
                        value = '';
                      }
                      controller.year = value;
                    },
                  )),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  controller.searchpart();
                  Get.to(() => ser());
                },
                child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 60,
                    height: 50,
                    child: Icon(Icons.search)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
