import 'package:flutter/material.dart';
import 'package:get/get.dart';

class admindashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fc),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('لوحة تحكم الادمن'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.toNamed('/companymanager');
                },
                icon: const Icon(Icons.business),
                label: const Text('ادارة الشركات'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.toNamed('/workshopmanager');
                },
                icon: const Icon(Icons.handyman),
                label: const Text('ادارة الورشات'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
