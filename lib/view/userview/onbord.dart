import 'package:car_x/moudle/user_moudle/onbordcont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class onbord extends StatelessWidget {
  const onbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
              Colors.white,
              Theme.of(context).primaryColor.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/images/carloding.json",
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "المكان الأفضل",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo-Bold',
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(1.0, 1.0),
                          ),
                        ]),
                  ),
                  Text(
                    "للسيارات",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo-SemiBold',
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(1.0, 1.0),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "حيث تجد جميع المتطلبات (بيع - شراء - قطع غيار)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Cairo-Regular',
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "بالإضافة لميزات للعناية بسيارتك وصيانتها",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo-Regular',
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColorDark,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GetBuilder<onbordco>(
                        init: onbordco(),
                        builder: (controller) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20)),
                              onPressed: () {
                                controller.auth();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "لنبدأ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo-Bold'),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ));
                        }),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
