import 'package:shared_preferences/shared_preferences.dart';

savetoken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "token";
  final value = token;
  prefs.setString(key, value);
}

saveper(String per) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "per";
  final value = per;
  prefs.setString(key, value);
}

saveemployeetoken(String etoken) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "emplotoken";
  final value = etoken;
  prefs.setString(key, value);
}

savecaremployeetoken(String cartoken) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "caremptoken";
  final value = cartoken;
  prefs.setString(key, value);
}

savecarpartemployeetoken(String carparttoken) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "carpartemptoken";
  final value = carparttoken;
  prefs.setString(key, value);
}

saveusertoken(String carparttoken) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "usertoken";
  final value = carparttoken;
  prefs.setString(key, value);
}

saveworkshoptoken(String carparttoken) async {
  final prefs = await SharedPreferences.getInstance();
  final key = "worktoken";
  final value = carparttoken;
  prefs.setString(key, value);
}
