import 'package:car_x/moudle/employee/aaddemployee.dart';
import 'package:car_x/moudle/saleman/aaddsaleman.dart';

import 'package:car_x/view/addsaleman/addsalemancontroller.dart';

import 'package:car_x/view/addsaleman/viewsaleman/viewsalemancontroler.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class addsaleman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    addsalemancontroler controller = Get.put(
      addsalemancontroler(),
    );
    viewesaleecontroller controller1 = Get.put(
      viewesaleecontroller(),
    );
    return Scaffold(
      backgroundColor: Color(0xFFD2DCEE),
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            LottieBuilder.asset(
              "assets/images/82974-add-user.json",
              width: 140,
            ),
            Text(
              " اضف موظف للمخزن",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo-Regular',
                fontSize: 28,
              ),
            ),
            Form(
              key: controller.keysale,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 340,
                height: 540,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  color: Colors.white,
                  elevation: 12,
                  child: Column(children: [
                    ////////////////////////////username
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      width: 240,
                      height: 60,
                      child: GetBuilder<addsalemancontroler>(
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
                        child: GetBuilder<addsalemancontroler>(
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
                      child: GetBuilder<addsalemancontroler>(
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
                      child: GetBuilder<addsalemancontroler>(
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
                                      fontFamily: 'Cairo-Regular',
                                      fontSize: 16),
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
                    Row(
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
                          width: 60,
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            controller.checkvalidation();
                            addsalemanconn();
                          },
                          child: Text(
                            "اضف",
                            style: Theme.of(context).textTheme.displayMedium,
                          )),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 180,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    controller1.getallsaleman();
                  },
                  child: Text(
                    "عرض الموظفين",
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
