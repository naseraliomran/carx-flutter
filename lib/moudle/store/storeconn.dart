import 'package:car_x/view/addempl/addemplcontroller.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:car_x/view/addstore/addstorescontroller.dart';
import 'package:car_x/view/addstore/viewemployee/viewstorescontroler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> addstorecon() async {
  addstorecontroler controller = Get.put(
    addstorecontroler(),
  );
  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Store/save');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
    'storeName': controller.storename,
    'storeAddress': controller.storeaddress,
    'phoneNumber': controller.phonenumber,
    'city': controller.city,
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (status == 200) {
    Get.rawSnackbar(
      barBlur: 3,
      titleText: Text(
        "تمت العملية بنجاح",
        style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 26,
            fontFamily: 'Cairo-Regular'),
        textAlign: TextAlign.center,
      ),
      messageText: LottieBuilder.asset(
        "assets/images/7184-done.json",
        width: 170,
        height: 170,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  } else if (status == 500) {
    Get.rawSnackbar(
      messageText: LottieBuilder.asset(
        "assets/images/94303-failed.json",
        width: 130,
        height: 130,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  }
}

Future<void> updatestoreco() async {
  addstorecontroler controller = Get.put(
    addstorecontroler(),
  );
  viewestorecontroller controller1 = Get.put(
    viewestorecontroller(),
  );
  var ids = controller1.id;
  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Store/update/$ids');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
    'storeName': controller.storename,
    'storeAddress': controller.storeaddress,
    'phoneNumber': controller.phonenumber,
    'city': controller.city,
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (status == 200) {
    Get.back();
    Get.rawSnackbar(
      barBlur: 2,
      titleText: Text(
        "تمت العملية بنجاح",
        style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 26,
            fontFamily: 'Cairo-Regular'),
        textAlign: TextAlign.center,
      ),
      messageText: LottieBuilder.asset(
        "assets/images/7184-done.json",
        width: 170,
        height: 170,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  } else {}
}

class updatestore extends StatelessWidget {
  addstorecontroler controller = Get.put(
    addstorecontroler(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.keyupdatesto,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/images/lf30_editor_13j7sry5.json",
                    width: 120,
                  ),
                  Text(
                    "تعديل بيانات المخزن ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 36,
                        fontFamily: 'Cairo-Regular'),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: 240,
                    height: 60,
                    child: GetBuilder<addstorecontroler>(
                        init: addstorecontroler(),
                        builder: (controller) => TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[ا-ي a-z A-Z]+$')
                                        .hasMatch(value)) {
                                  return "please enter corect name";
                                }
                                if (value.length <= 5) {
                                  return "short user name";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.label),
                                iconColor: Theme.of(context).primaryColor,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                                hintText: "اسم المخزن",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular',
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                controller.storename = value;
                              },
                            )),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ///////////////////////////phonenumber

                  Container(
                      width: 240,
                      height: 60,
                      child: GetBuilder<addstorecontroler>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter a password";
                                  }
                                  if (value.length <= 5) {
                                    return "short password";
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
                                  iconColor: Theme.of(context).primaryColor,
                                  prefixIcon: Icon(Icons.place),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
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
                                  hintText: "عنوان المخزن",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Cairo-Regular',
                                      fontSize: 16),
                                ),
                                onChanged: (value) {
                                  controller.storeaddress = value;
                                },
                              ))),

                  SizedBox(
                    height: 10,
                  ),
                  //////////////////////date of birth

                  Container(
                    width: 240,
                    height: 60,
                    child: GetBuilder<addstorecontroler>(
                        builder: (controller) => TextFormField(
                              keyboardType: TextInputType.datetime,
                              textAlign: TextAlign.right,
                              validator: (value) {
                                if (value!.length <= 9) {
                                  return "please enter correct phone number";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                iconColor: Theme.of(context).primaryColor,
                                prefixIcon: Icon(Icons.phone),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                                hintText: "رقم الهاتف",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular',
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                controller.phonenumber = value;
                              },
                            )),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //////////////////////////jop

                  ///////////////////////password

                  Container(
                    width: 240,
                    height: 60,
                    child: GetBuilder<addstorecontroler>(
                        builder: (controller) => TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              validator: (value) {
                                if (value!.length > 2) {
                                  return "please enter a valid number";
                                } else if (value.isEmpty) {
                                  return "please enter a number";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                iconColor: Theme.of(context).primaryColor,
                                prefixIcon: Icon(Icons.location_city),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
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
                                hintText: "المدينة",
                                hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular', fontSize: 16),
                              ),
                              onChanged: (value) {
                                controller.city = value;
                              },
                            )),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.checkvalidation();
                      updatestoreco();
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "تم",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
