import 'package:car_x/theme/theme.dart';
import 'package:car_x/view/adminview/admindashbord/admindash.dart';
import 'package:car_x/view/adminview/cars_company/companys.dart';
import 'package:car_x/view/adminview/view_cars_comp/view_companys.dart';
import 'package:car_x/view/adminview/view_workshops/view_workshop.dart';
import 'package:car_x/view/adminview/workshope/workshope.dart';
import 'package:car_x/view/cars/dashbord/addcardash.dart';
import 'package:car_x/view/dashbord/dashbordpage.dart';
import 'package:car_x/view/home/homepage.dart';
import 'package:car_x/view/manegerdashpord/manegerdashbordpage.dart';
import 'package:car_x/view/my_account/accountpage.dart';
import 'package:car_x/view/rent/buypage.dart';
import 'package:car_x/view/salemandashbord/salemandashbord.dart';
import 'package:car_x/view/sell/sellpage.dart';
import 'package:car_x/view/userview/login.dart';
import 'package:car_x/view/userview/onbord.dart';
import 'package:car_x/view/userview/signup.dart';
import 'package:car_x/view/workshop/work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/onbord",
      theme: theme(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/onbord", page: () => onbord()),
        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/login", page: () => Signin()),
        GetPage(name: "/homepage", page: () => Homepage()),
        GetPage(name: "/accountpage", page: () => accountpage()),
        GetPage(name: "/sellpage", page: () => sellpage()),
        GetPage(name: "/buypage", page: () => buypage()),
        GetPage(name: "/dashbord", page: () => dashbord()),
        GetPage(name: "/admindashbord", page: () => admindashbord()),
        GetPage(name: "/companys", page: () => companys()),
        GetPage(name: "/viewcompanys", page: () => viewcompanys()),
        GetPage(name: "/workshop", page: () => workshop()),
        GetPage(name: "/viewworkshop", page: () => viewworkshop()),
        GetPage(name: "/manegerdashbord", page: () => manegerdashbord()),
        GetPage(name: "/employeedashbord", page: () => addcardashbord()),
        GetPage(name: "/salemandashbord", page: () => salemandashbord()),
        GetPage(name: "/workdashbord", page: () => workshopdashbord()),
      ],
    );
  }
}
