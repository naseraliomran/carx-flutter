import 'package:car_x/control/user_controller/singupcontroller.dart';
import 'package:car_x/moudle/user_moudle/singupconnection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_x/widgets/input_decoration.dart';

class Signup extends StatelessWidget {
  final Usersignupcontroler controller = Get.put(Usersignupcontroler());

  Signup({super.key});



  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'اختر سنة الميلاد',
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
            textTheme: Theme.of(context)
                .textTheme
                .apply(fontFamily: 'Cairo-Regular'), // تطبيق الخط الأساسي
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      controller.age = picked.year.toString();
      controller.update(['ageField']);

      // إنشاء ويدجت Text مخصصة للعنوان والرسالة
      final snackbarTitle = Text(
        "تم الاختيار",
        style: TextStyle(
          fontFamily: 'Cairo-Regular', // تطبيق الخط هنا
          fontWeight: FontWeight.bold, // يمكنك تحديد الوزن أيضًا
          // أضف خصائص أخرى لـ TextStyle إذا لزم الأمر (مثل color, fontSize)
        ),
      );

      final snackbarMessage = Text(
        "سنة الميلاد: ${controller.age}",
        style: TextStyle(
          fontFamily: 'Cairo-Regular', // تطبيق الخط هنا
          // أضف خصائص أخرى لـ TextStyle إذا لزم الأمر
        ),
      );

      Get.snackbar(
        "", // اترك العنوان فارغًا هنا لأننا سنستخدم titleText
        "", // اترك الرسالة فارغة هنا لأننا سنستخدم messageText
        titleText: snackbarTitle,
        messageText: snackbarMessage,
        snackPosition: SnackPosition.BOTTOM,
        // يمكنك إضافة خصائص أخرى لـ Get.snackbar مثل backgroundColor, colorText (للألوان الافتراضية إذا لم يتم تحديدها في TextStyle)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primaryColor = theme.primaryColor;
    final Color onPrimaryColor = theme.colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: const Color(0xfff4f7fc),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/your_logo.png',
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.directions_car,
                        size: 70, color: primaryColor.withOpacity(0.7));
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  'إنشاء حساب جديد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "يرجى ملء البيانات التالية لإكمال التسجيل",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 25.0),
                child: Form(
                  key: controller.key2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildUsernameField(context, primaryColor),
                      const SizedBox(height: 18),
                      _buildPhoneNumberField(context, primaryColor),
                      const SizedBox(height: 18),
                      _buildAgeField(context, primaryColor),
                      const SizedBox(height: 18),
                      _buildJobField(context, primaryColor),
                      const SizedBox(height: 18),
                      _buildPasswordField(context, primaryColor),
                      const SizedBox(height: 25),
                      _buildGenderSelection(context, primaryColor),
                      const SizedBox(height: 30),
                      _buildCreateAccountButton(
                          context, primaryColor, onPrimaryColor),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "هل لديك حساب بالفعل؟",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15, color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    textAlign: TextAlign.right,
                    style: TextStyle(
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

  Widget _buildUsernameField(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
      builder: (ctrl) => TextFormField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !RegExp(r'^[ا-ي a-z A-Z\s]+$').hasMatch(value)) {
            return "الرجاء إدخال اسم صحيح";
          }
          if (value.length <= 4) {
            return "اسم المستخدم قصير";
          }
          return null;
        },
        cursorColor: primaryColor,
        style: const TextStyle(fontSize: 16),
        decoration: buildInputDecoration(
          context: context,
          hintText: "اسم المستخدم",
          prefixIconData: Icons.person_outline,
          primaryColor: primaryColor,
        ),
        onChanged: (value) => ctrl.username = value,
      ),
    );
  }

  Widget _buildPhoneNumberField(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
      builder: (ctrl) => TextFormField(
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        validator: (value) {
          if (value == null || value.length <= 9) {
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
        onChanged: (value) => ctrl.phonenumber = value,
      ),
    );
  }

  Widget _buildAgeField(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
        id: 'ageField',
        builder: (ctrl) {
          final ageController = TextEditingController(text: ctrl.age);
          ageController.selection = TextSelection.fromPosition(
              TextPosition(offset: ageController.text.length));

          return TextFormField(
            controller: ageController,
            readOnly: true,
            onTap: () => _selectDate(context),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "الرجاء إدخال سنة الميلاد";
              }
              return null;
            },
            cursorColor: primaryColor,
            style: const TextStyle(fontSize: 16),
            decoration: buildInputDecoration(
              context: context,
              hintText: "سنة الميلاد",
              prefixIconData: Icons.cake_outlined,
              primaryColor: primaryColor,
            ),
          );
        });
  }

  Widget _buildJobField(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
      builder: (ctrl) => TextFormField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !RegExp(r'^[ا-ي a-z A-Z\s]+$').hasMatch(value)) {
            return "الرجاء إدخال الوظيفة";
          }
          return null;
        },
        cursorColor: primaryColor,
        style: const TextStyle(fontSize: 16),
        decoration: buildInputDecoration(
          context: context,
          hintText: "الوظيفة",
          prefixIconData: Icons.work_outline,
          primaryColor: primaryColor,
        ),
        onChanged: (value) => ctrl.jop = value,
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
      builder: (ctrl) => TextFormField(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "الرجاء إدخال كلمة المرور";
          }
          if (value.length <= 5) {
            return "كلمة المرور قصيرة جداً";
          }
          return null;
        },
        cursorColor: primaryColor,
        style: const TextStyle(fontSize: 16),
        decoration: buildInputDecoration(
          context: context,
          hintText: "كلمة المرور",
          prefixIconData: Icons.lock_outline,
          primaryColor: primaryColor,
        ),
        obscureText: true,
        onChanged: (value) => ctrl.password = value,
      ),
    );
  }

  Widget _buildGenderSelection(BuildContext context, Color primaryColor) {
    return GetBuilder<Usersignupcontroler>(
        id: 'genderSelection',
        builder: (ctrl) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "الجنس:",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey[700]),
              ),
              _genderOption(
                context,
                iconAsset: "assets/images/icons8-male-60.png",
                label: "ذكر",
                isSelected: ctrl.gender == "male",
                onTap: () {
                  ctrl.gender = "male";
                  ctrl.update(['genderSelection']);
                },
                selectedColor: Colors.blue[100]!,
                primaryColor: primaryColor,
              ),
              _genderOption(
                context,
                iconAsset: "assets/images/icons8-person-female-50.png",
                label: "أنثى",
                isSelected: ctrl.gender == "female",
                onTap: () {
                  ctrl.gender = "female";
                  ctrl.update(['genderSelection']);
                },
                selectedColor: Colors.pink[100]!,
                primaryColor: primaryColor,
              ),
            ],
          );
        });
  }

  Widget _genderOption(
    BuildContext context, {
    required String iconAsset,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color selectedColor,
    required Color primaryColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? selectedColor.withOpacity(0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey[400]!,
            width: isSelected ? 2.0 : 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconAsset,
                height: 30,
                width: 30,
                color: isSelected ? primaryColor : Colors.grey[600]),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? primaryColor : Colors.grey[700],
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton(
      BuildContext context, Color primaryColor, Color onPrimaryColor) {
    return SizedBox(
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
          if (controller.key2.currentState?.validate() ?? false) {
            controller.checksingup();
            singupco();
          }
        },
        child: Text(
          "إنشاء الحساب",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: onPrimaryColor,
          ),
        ),
      ),
    );
  }
}
