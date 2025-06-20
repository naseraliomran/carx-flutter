import 'package:car_x/control/user_controller/logincontroller.dart';
import 'package:car_x/moudle/user_moudle/loginconnection.dart'; // Assuming loginco() is used
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_x/widgets/input_decoration.dart';

class Signin extends StatelessWidget {
  final Userlogincontroler controller = Get.put(Userlogincontroler());

  Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primaryColor = theme.primaryColor;
    final Color onPrimaryColor = theme.colorScheme.onPrimary;

    // Flutter's MaterialApp should handle Directionality based on locale.
    // If you need to force RTL for this screen specifically:
    // return Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: Scaffold(...)
    // );
    // However, it's usually better to let the framework handle it.

    return Scaffold(
      backgroundColor: const Color(0xfff4f7fc),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          children: [
            // Header Section
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'CarX', // App Name - Assuming this might be in English or a brand name
                    textAlign: TextAlign.center, // Center if it's a brand name
                    style: TextStyle(
                      fontFamily: 'Cairo-Bold',
                      fontSize: 24,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "مرحباً بك! قم بتسجيل الدخول للمتابعة",
                  textAlign: TextAlign.center, // Centering the welcome message
                  style: TextStyle(
                    fontFamily: 'Cairo-Regular',
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Login Form Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Form(
                  key: controller.key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Phone Number Field
                      GetBuilder<Userlogincontroler>(
                        builder: (ctrl) => TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign:
                              TextAlign.right, // Crucial for Arabic input
                          textDirection: TextDirection
                              .rtl, // Explicitly set text direction
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء إدخال رقم الهاتف";
                            }
                            if (value.length <= 9) {
                              return "الرجاء إدخال رقم هاتف صحيح";
                            }
                            return null;
                          },
                          cursorColor: primaryColor,
                          style: const TextStyle(fontSize: 16),
                          decoration: buildInputDecoration(
                            context: context,
                            hintText: "رقم الهاتف",
                            prefixIconData: Icons.phone_android_outlined,
                            primaryColor: primaryColor,
                          ),
                          onChanged: (value) {
                            ctrl.phonenumber = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Password Field
                      GetBuilder<Userlogincontroler>(
                        builder: (ctrl) => TextFormField(
                          textAlign: TextAlign
                              .right, // Crucial for Arabic input (if password might contain it)
                          // Or TextAlign.left if passwords are LTR
                          textDirection: TextDirection
                              .ltr, // Passwords are often LTR even in RTL UIs
                          // Adjust if your passwords are RTL
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء إدخال كلمة المرور";
                            }
                            if (value.length <= 5) {
                              return "كلمة المرور قصيرة";
                            }
                            return null;
                          },
                          cursorColor: primaryColor,
                          style: const TextStyle(fontSize: 16),
                          decoration: buildInputDecoration(
                            context: context,
                            hintText:
                                "كلمة المرور", // Hint text will respect TextFormField's textAlign
                            prefixIconData: Icons.lock_outline,
                            primaryColor: primaryColor,
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            ctrl.password = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Forgot Password Link
                      Align(
                        alignment: AlignmentDirectional
                            .centerEnd, // Use AlignmentDirectional for RTL/LTR adaptability
                        child: TextButton(
                          onPressed: () {
                            Get.snackbar("Info",
                                "Forgot Password functionality (UI only)");
                          },
                          child: Text(
                            "نسيت كلمة المرور؟",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Cairo-Regular',
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: onPrimaryColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            if (controller.key.currentState?.validate() ??
                                false) {
                              controller.checklofin();
                              loginco();
                            }
                          },
                          child: Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.center, // Center button text
                            style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              fontSize: 18,
                              color: onPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
            // Footer Actions (e.g., Sign Up)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ليس لديك حساب؟",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'Cairo-Regular',
                      fontSize: 15,
                      color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Get.snackbar(
                        "Info", "Create Account functionality (UI only)");
                  },
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: Text(
                    "إنشاء حساب جديد",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Cairo-Bold',
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
