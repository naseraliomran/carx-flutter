import 'package:flutter/foundation.dart';
import 'package:car_x/config/api_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class sellcar extends GetxController {
  var buyerName;
  var buyersPhoneNumber;
  var id;
  Future<void> sellcarconn() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Car/saleCar/$id');
    var response = await http.post(url,
        body: {'buyerName': buyerName, 'buyersPhoneNumber': buyersPhoneNumber});

    var status = response.statusCode;

    if (status == 200) {
      if (response.body.contains('"This car is sold out"')) {
        Get.rawSnackbar(
          barBlur: 2,
          titleText: Text(
            "السيارة مباعة   ",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 26,
                fontFamily: 'Cairo-Regular'),
            textAlign: TextAlign.center,
          ),
          messageText: LottieBuilder.asset(
            "assets/images/94303-failed.json",
            width: 170,
            height: 170,
            repeat: false,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.transparent,
        );
      } else {
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
      }
      if (kDebugMode) debugPrint(response.body);

      update();
    }
  }

  final GlobalKey<FormState> keysellcar = GlobalKey<FormState>();
  checksellcar() {
    final isvalid = keysellcar.currentState!.validate();
    if (!isvalid) {
      return;
    }
    keysellcar.currentState!.save();
  }
}

class sellcars extends StatelessWidget {
  const sellcars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<sellcar>(
      init: sellcar(),
      builder: (controller) => Form(
        key: controller.keysellcar,
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
                      if (value!.length <= 5) {
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
                      hintText: " اسم الشاري ",
                      hintStyle: const TextStyle(
                        fontFamily: 'Cairo-Regular',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      controller.buyerName = value;
                    },
                  )),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: 240,
                height: 60,
                child: GetBuilder<sellcar>(
                    init: sellcar(),
                    builder: (controller) => TextFormField(
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
                            hintText: " رقم هاتف الشاري  ",
                            hintStyle: const TextStyle(
                              fontFamily: 'Cairo-Regular',
                              fontSize: 16,
                            ),
                          ),
                          onChanged: (value) {
                            controller.buyersPhoneNumber = value;
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
                  controller.checksellcar();
                  controller.sellcarconn();
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
