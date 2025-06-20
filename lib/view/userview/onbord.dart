import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:car_x/moudle/user_moudle/onbordcont.dart';

class onbord extends StatefulWidget {
  const onbord({Key? key}) : super(key: key);

  @override
  State<onbord> createState() => _onbordState();
}

class _onbordState extends State<onbord> {
  final onbordco controller = Get.put(onbordco());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      controller.auth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/images/carloding.json',
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              'CarX',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Cairo-Bold',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
