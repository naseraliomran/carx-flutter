import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'account_title': 'My Account',
          'currency': 'Currency',
          'logout': 'Logout',
          'language': 'Language',
          'change_password': 'Change Password',
          'theme': 'Theme',
          'warning': 'Warning',
          'logout_question': 'Are you sure you want to logout?',
          'confirm': 'Confirm',
          'old_password': 'Old Password',
          'new_password': 'New Password',
        },
        'ar': {
          'account_title': 'حسابي',
          'currency': 'العملة',
          'logout': 'تسجيل الخروج',
          'language': 'اللغة',
          'change_password': 'تغيير كلمة المرور',
          'theme': 'الثيم',
          'warning': 'تحذير ',
          'logout_question': 'هل انت متاكد من العملية؟',
          'confirm': 'تاكيد',
          'old_password': 'كلمة المرور القديمة',
          'new_password': 'كلمة المرور الجديدة',
        },
      };
}
