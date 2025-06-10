import 'dart:convert';
import 'package:car_x/view/requestment/viewavworkshop.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewment extends StatelessWidget {
  viewment({Key? key}) : super(key: key);
  getallmentreqcontroller controller = Get.put(
    getallmentreqcontroller(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          heroTag: Text('btn2'),
          backgroundColor: const Color(0xFF3377CF),
          onPressed: () {
            controller.determinePosition();
            controller._getCurrentLocation();
            Get.to(() => viewavworkshop());
          },
          label: Text(
            "ارسال طلب صيانة",
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          )),
      body: GetBuilder<getallmentreqcontroller>(
        init: getallmentreqcontroller(),
        builder: (controller) => RefreshIndicator(
          onRefresh: () => controller.getallmentreqconn(),
          child: controller.reqx.isEmpty
              ? Center(
                  child: Text(
                    'لا توجد طلبات صيانة',
                    style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 28,
                        fontFamily: 'Cairo-Regular'),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.reqx.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                margin: EdgeInsets.all(16),
                                color: Theme.of(context).primaryColor,
                                elevation: 6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 40),
                                          child: Text(
                                            "الوصف  " +
                                                controller.data[index]
                                                        ['description']
                                                    .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'الطلب قيد المراجعة',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 18,
                                              fontFamily: 'Cairo-Regular'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    MaterialButton(
                                      color: Colors.redAccent[400],
                                      onPressed: () {
                                        controller.id = controller.data[index]
                                                ['id']
                                            .toString();
                                        controller.deletereqconn();
                                      },
                                      child: Text(
                                        "الغاء الطلب",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ]);
                  },
                ),
        ),
      ),
    );
  }
}

class getallmentreqcontroller extends GetxController {
  late Position currentPosition;
  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    await getallmentreqconn();
    update();
    print(token);
    super.onInit();
  }

  var woid;
  var description = '';
  var token;
  var data;
  var id;
  var id2;
  List reqx = [];
  Future getallmentreqconn() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Customer/Maintenance/myMaintenanceRequest');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data = json.decode(response.body);
    if (status == 200) {
      reqx = data;
      print(data);
      update();
    }
  }

  var data2;
  Future sendreqconn() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Customer/Maintenance/sendRequest/$woid');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    }, body: {
      'address_latitude': currentPosition.latitude.toString(),
      'address_longitude': currentPosition.longitude.toString(),
      'description': description
    });
    refresh();
    var status = response.statusCode;

    print(status);
    if (response.body.isNotEmpty) {
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تمت أرسال الطلب  بنجاح",
          style: TextStyle(
              color: Color(0xFFFFFFFF),
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
        backgroundColor: Colors.grey,
      );

      update();
    }
  }

  var data3;
  Future deletereqconn() async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/Customer/Maintenance/deleteRequest/$id');
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
    });
    refresh();
    var status = response.statusCode;
    data3 = json.decode(response.body);
    if (status == 200) {
      print(data3);
      Get.rawSnackbar(
        barBlur: 3,
        titleText: Text(
          "تمت ألغاء الطلب  بنجاح",
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 26,
              fontWeight: FontWeight.bold,
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
  }

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentPosition = position;
      update();
    }).catchError((e) {
      print(e);
    });
  }
}
