import 'package:car_x/control/worksope/workshope_controller.dart';
import 'package:car_x/moudle/admin/add_workshop.dart';
import 'package:car_x/moudle/user_moudle/logoutconn.dart';
import 'package:car_x/view/googlemap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class workshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logoutcontroller controller1 = Get.put(
      logoutcontroller(),
    );
    workashopcontrol controller = Get.put(workashopcontrol(), permanent: true);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xfff4f7fc),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                  ),
                  width: double.maxFinite,
                  height: 160,
                ),
                Container(
                  margin: EdgeInsets.only(left: 80, top: 26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  width: 140,
                  height: 120,
                  child: Image.asset(
                    'assets/images/hatla2ee_logo_new.png',
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/viewcompanys");
                  },
                  child: Text(
                    "عرض الشركات ",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 24,
                        fontFamily: 'Cairo-Regular'),
                  )),
              Divider(
                thickness: 2,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/viewworkshop");
                  },
                  child: Text(
                    "عرض ورش الصيانة",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 24,
                        fontFamily: 'Cairo-Regular'),
                  )),
              SizedBox(
                height: 190,
              ),
              TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        backgroundColor: Color(0xFF164f9c),
                        title: "تحذير ",
                        titleStyle: TextStyle(
                            color: Color(0xFFE44848),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo-Regular'),
                        middleTextStyle:
                            Theme.of(context).textTheme.displayMedium,
                        middleText: "هل انت متاكد من العملية؟",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.red,
                        confirm: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            child: MaterialButton(
                              child: Text("تاكيد",
                                  style: TextStyle(
                                      color: Color(0xFFE44848),
                                      fontSize: 28,
                                      fontFamily: 'Cairo-Regular')),
                              onPressed: () {
                                controller1.logoutco();
                              },
                            )));
                  },
                  child: Text(
                    "تسجيل الخروج",
                    style: TextStyle(
                        color: Color(0xFFDA0707),
                        fontSize: 20,
                        fontFamily: 'Cairo-Regular'),
                  )),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            "اضف ورشة صيانة",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
      body: ListView(children: [
        Form(
          key: controller.key4,
          child: Column(children: [
            LottieBuilder.asset(
              "assets/images/83479-car-accident.json",
              width: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_membership),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      init: workashopcontrol(),
                      builder: (controller) => TextFormField(
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            validator: (value) {
                              if (value!.length <= 4) {
                                return "short workshop name";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
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
                              hintText: "اسم الورشة",
                              hintStyle: TextStyle(
                                fontFamily: 'Cairo-Regular',
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              controller.name_ar = value;
                            },
                          )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            validator: (value) {
                              if (value!.length <= 2) {
                                return "wrong address";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
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
                              hintText: "العنوان",
                              hintStyle: TextStyle(
                                fontFamily: 'Cairo-Regular',
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              controller.address = value;
                            },
                          )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      width: 95,
                      height: 60,
                      child: GetBuilder<workashopcontrol>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                validator: (value) {
                                  if (value!.length > 4) {
                                    return "please enter a valid time";
                                  } else if (value.isEmpty) {
                                    return "please enter a time";
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
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
                                  hintText: "من الساعة",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular',
                                    fontSize: 16,
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.timefrom = value;
                                },
                              )),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right_alt),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      width: 90,
                      height: 60,
                      child: GetBuilder<workashopcontrol>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                validator: (value) {
                                  if (value!.length > 4) {
                                    return "please enter a valid time";
                                  } else if (value.isEmpty) {
                                    return "please enter a time";
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
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
                                  hintText: "الى",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Cairo-Regular',
                                    fontSize: 16,
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.timeto = value;
                                },
                              )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ///////////////////////////phonenumber
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
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
                              hintText: " رقم هاتف الورشة",
                              hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular', fontSize: 16),
                            ),
                            onChanged: (value) {
                              controller.phone = value;
                            },
                          )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            //
            /////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      init: workashopcontrol(),
                      builder: (controller) => TextFormField(
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            validator: (value) {
                              if (value!.length <= 5) {
                                return "short user name";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
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
                              hintText: "اسم مدير الورشة",
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
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ///////////////////////////phonenumber
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
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
                              hintText: "رقم هاتف مدير الورشة",
                              hintStyle: TextStyle(
                                  fontFamily: 'Cairo-Regular', fontSize: 16),
                            ),
                            onChanged: (value) {
                              controller.phonenumber = value;
                            },
                          )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
/////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.date_range),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            keyboardType: TextInputType.datetime,
                            textAlign: TextAlign.start,
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
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ///////////////////////password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.password_outlined),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            textAlign: TextAlign.start,
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
              ],
            ),
            SizedBox(
              height: 25,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 12,
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    Get.to(() => MapSample());
                  },
                  child: Text(
                    "حدد موقع الورشة",
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 12,
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    controller.checkaddcompany();
                    addworkeshopconn();
                  },
                  child: Text(
                    "تم",
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ),
          ]),
        ),
      ]),
    );
  }
}
