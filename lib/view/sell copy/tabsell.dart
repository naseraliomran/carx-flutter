import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sellnrenttab extends GetxController with SingleGetTickerProviderMixin {
  late TabController con;
  List<Tab> tab = <Tab>[
    Tab(
      text: "سيارات للأجار",
    ),
    Tab(
      text: "سيارات للبيع",
    )
  ];
  @override
  void onInit() {
    con = TabController(length: 2, vsync: this);
    // TODO: implement onInit
    super.onInit();
  }
}
