import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class rentmycar extends GetxController {
  var tenantName;
  var tenantPhoneNumber;
  var bookingPeriod;
  var id;
  Future<void> myrentcarconn() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/User/Car/carRental/$id');
    var response = await http.post(url, body: {
      'tenantName': tenantName,
      'tenantPhoneNumber': tenantPhoneNumber,
      'bookingPeriod': bookingPeriod
    });

    var status = response.statusCode;
    print(response.body);
    if (status == 200) {
      Get.rawSnackbar(
        barBlur: 2,
        titleText: Text(
          "تمت العملية  بنجاح",
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
      update();
    }
  }

  final GlobalKey<FormState> keyrentmycar = GlobalKey<FormState>();
  checkrentcar() {
    final isvalid = keyrentmycar.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keyrentmycar.currentState!.save();
  }
}

class rentmycars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<rentmycar>(
      init: rentmycar(),
      builder: (controller) => Form(
        key: controller.keyrentmycar,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/images/68986-car-aprroved.json',
                width: 100,
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                  width: 240,
                  height: 60,
                  child: TextFormField(
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
                      prefixIcon: Icon(Icons.person),
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
                      hintText: " اسم المستأجر ",
                      hintStyle: const TextStyle(
                        fontFamily: 'Cairo-Regular',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      controller.tenantName = value;
                    },
                  )),
              const SizedBox(
                height: 22,
              ),
              Container(
                  width: 240,
                  height: 60,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    validator: (value) {
                      if (value!.length <= 9) {
                        return "enter correct information";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
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
                      hintText: " رقم هاتف المستأجر  ",
                      hintStyle: const TextStyle(
                        fontFamily: 'Cairo-Regular',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      controller.tenantPhoneNumber = value;
                    },
                  )),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: 240,
                height: 60,
                child: GetBuilder<rentmycar>(
                    init: rentmycar(),
                    builder: (controller) => TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          validator: (value) {
                            if (value!.length == null) {
                              return "enter correct information";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black87,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.timer_outlined),
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
                            hintText: "   مدة الاستأجار  بالأيام ",
                            hintStyle: const TextStyle(
                              fontFamily: 'Cairo-Regular',
                              fontSize: 16,
                            ),
                          ),
                          onChanged: (value) {
                            controller.bookingPeriod = value;
                          },
                        )),
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  controller.checkrentcar();
                  controller.myrentcarconn();
                },
                child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 200,
                    height: 60,
                    child: Text("اضف  المعلومات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Cairo-Regular'))),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
