import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ment extends GetxController with SingleGetTickerProviderMixin {
  late TabController con;
  List<Tab> tab = <Tab>[
    Tab(
      text: 'اضافة قطع غيار',
    ),
    Tab(
      text: "طلبات الصيانة",
    ),
  ];
  @override
  void onInit() {
    con = TabController(length: 2, vsync: this);
    // TODO: implement onInit
    super.onInit();
  }
}
