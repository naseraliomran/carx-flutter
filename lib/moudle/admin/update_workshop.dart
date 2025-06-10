import 'package:car_x/control/view_workshop/view_workshope_cont.dart';
import 'package:car_x/control/worksope/workshope_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

viewworkshopcontroller controller1 = Get.put(
  viewworkshopcontroller(),
);
workashopcontrol controller = Get.put(
  workashopcontrol(),
);
var ids = controller1.id;
Future<void> updateworkshop() async {
  var url = Uri.parse('http://10.0.2.2:8000/api/Workshop/update/$ids');
  var response = await http.post(url, body: {
    'nameWorkshop': controller.name_ar,
    'phone': controller.phonenumber,
    'address': controller.address,
    'workingTimeFrom': '${controller.timefrom}:00:00',
    'workingTimeTo': '${controller.timeto}:00:00',
    'address_longitude': controller.long.toString(),
    'address_latitude': controller.lat.toString(),
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
            color: Color(0xFF164f92),
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

class updatewo extends StatelessWidget {
  viewworkshopcontroller controller = Get.put(
    viewworkshopcontroller(),
  );
  workashopcontrol controller1 = Get.put(
    workashopcontrol(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 60,
        ),
        LottieBuilder.asset(
          "assets/images/lf30_editor_13j7sry5.json",
          height: 120,
        ),
        SizedBox(
          height: 60,
        ),
        Form(
          key: controller.key6,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_membership),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
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
                              if (value!.length <= 3) {
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  width: 240,
                  height: 60,
                  child: GetBuilder<workashopcontrol>(
                      builder: (controller) => TextFormField(
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            validator: (value) {
                              if (value!.length <= 3) {
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
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      width: 120,
                      height: 60,
                      child: GetBuilder<workashopcontrol>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                validator: (value) {
                                  if (value!.isEmpty) {
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
                  width: 20,
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
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      width: 80,
                      height: 60,
                      child: GetBuilder<workashopcontrol>(
                          builder: (controller) => TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                validator: (value) {
                                  if (value!.isEmpty) {
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
                    color: Colors.grey[200],
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
                              controller.phonenumber = value;
                            },
                          )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            //
            //////////////////////username

            SizedBox(
              height: 40,
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
                    controller.checkaddcompany();

                    updateworkshop();
                  },
                  child: Text(
                    "تم",
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ),
            SizedBox(
              height: 60,
            ),
          ]),
        ),
      ]),
    );
  }
}
