import 'package:flutter/material.dart';
import 'package:get/get.dart';

class hometab extends GetxController with SingleGetTickerProviderMixin {
  late TabController con;
  List<Tab> tab = <Tab>[
    Tab(
      text: "المعرض",
    ),
    Tab(
      text: "سياراتي ",
    )
  ];
  @override
  void onInit() {
    con = TabController(length: 2, vsync: this);
    // TODO: implement onInit
    super.onInit();
  }
}
