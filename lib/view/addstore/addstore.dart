import 'package:car_x/moudle/store/storeconn.dart';
import 'package:car_x/view/addempl/addemplcontroller.dart';
import 'package:car_x/view/addempl/viewemployee/viewemployeecontroler.dart';
import 'package:car_x/view/addstore/addstorescontroller.dart';
import 'package:car_x/view/addstore/viewemployee/viewstorescontroler.dart';
import 'package:car_x/view/cars/addcar/addcarconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class addstore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    addstorecontroler controller = Get.put(
      addstorecontroler(),
    );
    viewestorecontroller controller1 = Get.put(
      viewestorecontroller(),
    );
    return Scaffold(
      backgroundColor: Color(0xFFD2DCEE),
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            LottieBuilder.asset(
              "assets/images/11759-ui-success-store.json",
              width: 180,
            ),
            Text(
              "اضف مخزن",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo-Regular',
                fontSize: 28,
              ),
            ),
            Form(
              key: controller.keysto,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 340,
                height: 390,
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
                                  prefixIcon: Icon(Icons.storage),
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
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  validator: (value) {
                                    if (value!.length <= 3) {
                                      return "please enter correct phone number";
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
                                  if (value!.length <= 3) {
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

                    Container(
                      width: 240,
                      height: 60,
                      child: GetBuilder<addstorecontroler>(
                          builder: (controller) => TextFormField(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[ا-ي a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    return "please enter this feild";
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  iconColor: Theme.of(context).primaryColor,
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
                                  hintText: " المدينة",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular',
                                    fontSize: 16,
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.city = value;
                                },
                              )),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    ///////////////////////password

                    Container(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            controller.checkvalidation();
                            addstorecon();
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
                    controller1.getallstores();
                  },
                  child: Text(
                    "عرض المخازن",
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
