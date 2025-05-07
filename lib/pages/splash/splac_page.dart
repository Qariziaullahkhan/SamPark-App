import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/controller/splash_controller.dart';

class SplacPage extends StatelessWidget {
  const SplacPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashcontroller = Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Image.asset(AssetsImages.logoPNG),
      ),
    );
  }
}
