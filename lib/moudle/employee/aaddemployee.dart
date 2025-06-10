import 'package:car_x/moudle/admin/update_company.dart';
import 'package:car_x/view/addempl/addemplcontroller.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> addemployeeco() async {
  addemplocontroler controller = Get.put(
    addemplocontroler(),
  );
  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Employee/save');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
    'name': controller.username,
    'mobile': controller.phonenumber,
    'age': controller.age,
    'jop': controller.jop,
    'gender': controller.gender,
    'password': controller.password
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

Future<void> updateemployeeco() async {
  addemplocontroler controller = Get.put(
    addemplocontroler(),
  );
  viewemployeecontroller controller1 = Get.put(
    viewemployeecontroller(),
  );
  var ids = controller1.id;
  var token = controller.token.toString();
  var url = Uri.parse('http://10.0.2.2:8000/api/Employee/update/$ids');
  var response = await http.post(url, headers: {
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  }, body: {
    'name': controller.username,
    'mobile': controller.phonenumber,
    'age': controller.age,
    'jop': controller.jop,
    'gender': controller.gender,
    'password': controller.password
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (status == 200) {
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

class updateempl extends StatelessWidget {
  addemplocontroler controller = Get.put(
    addemplocontroler(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.keyupdateemp,
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
                    "تعديل بيانات الموضف ",
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
                    child: GetBuilder<addemplocontroler>(
                        init: addemplocontroler(),
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
                                prefixIcon: Icon(Icons.person),
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
                                hintText: "اسم المستخدم",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular',
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                controller.username = value;
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
                      child: GetBuilder<addemplocontroler>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
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
                                  prefixIcon: Icon(Icons.phone_rounded),
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
                                      fontSize: 16),
                                ),
                                onChanged: (value) {
                                  controller.phonenumber = value;
                                },
                              ))),

                  SizedBox(
                    height: 10,
                  ),
                  //////////////////////date of birth

                  Container(
                    width: 240,
                    height: 60,
                    child: GetBuilder<addemplocontroler>(
                        builder: (controller) => TextFormField(
                              keyboardType: TextInputType.datetime,
                              textAlign: TextAlign.right,
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
                                prefixIcon: Icon(Icons.date_range),
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
                                hintText: "العمر",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular',
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                controller.age = value;
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
                    child: GetBuilder<addemplocontroler>(
                        builder: (controller) => TextFormField(
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
                                prefixIcon: Icon(Icons.vpn_key),
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
                                hintText: "كلمة المرور",
                                hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular', fontSize: 16),
                              ),
                              obscureText: true,
                              onChanged: (value) {
                                controller.password = value;
                              },
                            )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<addemplocontroler>(
                      builder: (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: Colors.lightBlue[100],
                                  child: IconButton(
                                      onPressed: () {
                                        controller.gender = "male";
                                      },
                                      icon: Image.asset(
                                        "assets/images/icons8-male-60.png",
                                      ))),
                              SizedBox(
                                width: 50,
                              ),
                              Card(
                                  color: Colors.pinkAccent[100],
                                  child: IconButton(
                                      onPressed: () {
                                        controller.gender = "female";
                                      },
                                      icon: Image.asset(
                                        "assets/images/icons8-person-female-50.png",
                                      ))),
                            ],
                          )),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.checkvalidation();
                      updateemployeeco();
                      Get.back();
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
