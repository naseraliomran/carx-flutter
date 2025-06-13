import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyController extends GetxController {
  String currency = 'IQD';

  @override
  void onInit() {
    _loadCurrency();
    super.onInit();
  }

  Future<void> _loadCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    currency = prefs.getString('currency') ?? 'IQD';
    update();
  }

  Future<void> toggleCurrency() async {
    currency = currency == 'IQD' ? 'USD' : 'IQD';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currency', currency);
    update();
  }
}
