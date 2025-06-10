import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class viewcopmanycontroller extends GetxController {
  final GlobalKey<FormState> key5 = GlobalKey<FormState>();
  @override
  Future<void> onInit() async {
    getallcompany();
    update();
    data;
  }

  String username = "";
  String phonenumber = "";
  String password = "";
  String gender = "";
  String age = "";
  var id;
  List data = [];

  Future<void> getallcompany() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/Company/getAll');

    var response = await http.get(
      url,
    );
    var status = response.statusCode;
    data = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (status == 200) {
    } else {}
    update();
  }

  void checkaddcompdirector() {
    final isvalid = key5.currentState!.validate();
    if (!isvalid) {
      return;
    }
    key5.currentState!.save();
  }
}
