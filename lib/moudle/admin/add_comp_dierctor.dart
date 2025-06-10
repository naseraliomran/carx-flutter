import 'package:car_x/control/view_company/view_companys.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> addcompanydierctor() async {
  viewcopmanycontroller controller = Get.put(
    viewcopmanycontroller(),
  );
  var ids = controller.id;
  var url =
      Uri.parse('http://10.0.2.2:8000/api/Company/setCompanyDirector/$ids');
  var response = await http.post(url, body: {
    'name': controller.username,
    'mobile': controller.phonenumber,
    'password': controller.password,
    'gender': controller.gender,
    'age': controller.age
  });

  var status = response.statusCode;
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (status == 200 &&
      response.body.contains("This Company has a Company Director")) {
    Get.rawSnackbar(
      titleText: Text(
        "الشركة تمتلك مدير",
        style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 26,
            fontFamily: 'Cairo-Regular'),
        textAlign: TextAlign.center,
      ),
      messageText: LottieBuilder.asset(
        "assets/images/94303-failed.json",
        width: 130,
        height: 130,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  } else {
    Get.rawSnackbar(
      messageText: LottieBuilder.asset(
        "assets/images/7184-done.json",
        width: 130,
        height: 130,
        repeat: false,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.transparent,
    );
  }
}

class add extends StatelessWidget {
  add({Key? key}) : super(key: key);
  viewcopmanycontroller controller = Get.put(
    viewcopmanycontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.key5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/images/lf30_editor_13j7sry5.json",
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "اضف مدير الشركة",
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
                    height: 50,
                    child: GetBuilder<viewcopmanycontroller>(
                        init: viewcopmanycontroller(),
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
                      height: 50,
                      child: GetBuilder<viewcopmanycontroller>(
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
                    height: 50,
                    child: GetBuilder<viewcopmanycontroller>(
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
                    height: 50,
                    child: GetBuilder<viewcopmanycontroller>(
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
                  GetBuilder<viewcopmanycontroller>(
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
                    height: 40,
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.checkaddcompdirector();
                      addcompanydierctor();
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "تم",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
