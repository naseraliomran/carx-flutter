import 'package:car_x/control/my_accountcontrol/accountcontroller.dart';
import 'package:car_x/control/user_controller/logincontroller.dart';
import 'package:car_x/control/currency_controller.dart';
import 'package:car_x/control/language_controller.dart';
import 'package:car_x/control/theme_controller.dart';
import 'package:car_x/moudle/user_moudle/logoutconn.dart';
import 'package:car_x/moudle/user_moudle/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

class accountpage extends StatelessWidget {
  Widget _infoRow(IconData icon, String text, BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 32),
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(width: 16),
        Text(text, style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<accountcontroller>(
      init: accountcontroller(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColorLight,
          appBar: AppBar(
            title: Text('account_title'.tr),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LottieBuilder.asset(
                      'assets/images/49896-user-icon.json',
                      width: 120,
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      margin: const EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoRow(Icons.person,
                                controller.users['name'].toString(), context),
                            const SizedBox(height: 12),
                            _infoRow(Icons.phone,
                                controller.users['mobile'].toString(), context),
                            const SizedBox(height: 12),
                            _infoRow(Icons.date_range,
                                controller.users['age'].toString(), context),
                            const SizedBox(height: 20),
                            GetBuilder<CurrencyController>(
                              init: CurrencyController(),
                              builder: (currencyController) {
                                return ElevatedButton.icon(
                                  onPressed: currencyController.toggleCurrency,
                                  icon: const Icon(Icons.attach_money),
                                  label: Text(
                                      '${'currency'.tr}: ${currencyController.currency}'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            GetBuilder<LanguageController>(
                              init: LanguageController(),
                              builder: (langController) {
                                return ElevatedButton.icon(
                                  onPressed: langController.toggleLanguage,
                                  icon: const Icon(Icons.language),
                                  label: Text('language'.tr),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            GetBuilder<ThemeController>(
                              builder: (themeController) {
                                return ElevatedButton.icon(
                                  onPressed: themeController.toggleTheme,
                                  icon: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: themeController.isDark
                                        ? const Icon(Icons.nightlight_round,
                                            key: ValueKey('dark'))
                                        : const Icon(Icons.wb_sunny,
                                            key: ValueKey('light')),
                                  ),
                                  label: Text('theme'.tr),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                final oldController = TextEditingController();
                                final newController = TextEditingController();
                                Get.defaultDialog(
                                  title: 'change_password'.tr,
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: oldController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'old_password'.tr),
                                      ),
                                      TextField(
                                        controller: newController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'new_password'.tr),
                                      ),
                                    ],
                                  ),
                                  onConfirm: () {
                                    Get.back();
                                  },
                                  textConfirm: 'confirm'.tr,
                                );
                              },
                              icon: const Icon(Icons.lock),
                              label: Text('change_password'.tr),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            GetBuilder<logoutcontroller>(
                              init: logoutcontroller(),
                              builder: (logout) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      backgroundColor: const Color(0xFF164f9c),
                                      title: 'warning'.tr,
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      middleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      middleText: 'logout_question'.tr,
                                      onConfirm: () {
                                        logout.logoutco();
                                        logout.erase();
                                      },
                                      confirmTextColor: Colors.white,
                                      buttonColor: Colors.red,
                                      textConfirm: 'confirm'.tr,
                                    );
                                  },
                                  icon: LottieBuilder.asset(
                                    'assets/images/68582-log-out.json',
                                    width: 40,
                                  ),
                                  label: Text('logout'.tr),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
