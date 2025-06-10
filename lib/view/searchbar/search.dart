import 'dart:convert';

import 'package:car_x/moudle/admin/frezz.dart';
import 'package:car_x/view/searchbar/resultesearch.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<searchbar>(
      didUpdateWidget: (oldWidget, state) => searchbar(),
      init: searchbar(),
      builder: (controller) => Center(
        child: RefreshIndicator(
          onRefresh: () => controller.searchconn(),
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
                        hintText: "اسم السيارة",
                        hintStyle: const TextStyle(
                          fontFamily: 'Cairo-Regular',
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        controller.name = value;
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
                            controller.priceto = value;
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
                            controller.pricefrom = value;
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
                        hintText: " سنة الصنع",
                        hintStyle: const TextStyle(
                          fontFamily: 'Cairo-Regular',
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        if (value == null) {
                          value = '';
                        }
                        controller.manufacturingYear = value;
                      },
                    )),
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
                        hintText: " المحافظة",
                        hintStyle: const TextStyle(
                          fontFamily: 'Cairo-Regular',
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        controller.city = value;
                        if (value == null) {
                          value = '';
                        }
                      },
                    )),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    controller.searchconn();
                    Get.to(() => resultsearch());
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
      ),
    ));
  }
}

class searchbar extends GetxController {
  var name = '';
  var manufacturingYear = '';
  var pricefrom = '';
  var priceto = '';
  var city = '';
  var data = [];
  List car = [];

  List imagecar = [];
  List imagecardetail = [];
  var detaildata;
  Future searchconn() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Car/search');
    var response = await http.post(url, body: {
      'name': name,
      'manufacturingYear': manufacturingYear,
      'pricefrom': pricefrom,
      'city': city,
      'priceto': priceto
    });

    var status = response.statusCode;
    data = json.decode(response.body);
    car = data;
    if (response.statusCode == 200) {
      update();
      print(data);
    } else {
      print(response.reasonPhrase);
    }
  }
}
