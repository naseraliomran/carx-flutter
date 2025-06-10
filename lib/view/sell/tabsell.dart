import 'package:flutter/material.dart';
import 'package:get/get.dart';

class selltab extends GetxController with SingleGetTickerProviderMixin {
  late TabController con;
  List<Tab> tab = <Tab>[
    Tab(
      text: "السيارات المباعة",
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
