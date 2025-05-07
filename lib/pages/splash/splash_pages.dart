import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/colors.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/config/strings.dart';
import 'package:sampark_app/widgets/mysize.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SplashPages extends StatelessWidget {
  const SplashPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Mysize(
                height: 48.h,
              ),
              Center(
                child: Image.asset(AssetsImages.logoPNG),
              ),
              Mysize(
                height: 160.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsImages.boyimages),
                  Image.asset(AssetsImages.arrowicon),
                  Image.asset(AssetsImages.girlimages),
                ],
              ),
              Mysize(
                height: 28.h,
              ),
              Text(
                AppsStrings.yourarenow,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Mysize(
                height: 8.h,
              ),
              Text(
                AppsStrings.connected,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Mysize(
                height: 8.h,
              ),
              Text(
                AppsStrings.discription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Mysize(
                height: 50.h,
              ),
              SlideAction(
                onSubmit: () {
                  Get.toNamed("/authpage");
                },
                text: "Slide to Continue",
                textStyle: Theme.of(context).textTheme.bodySmall,
                sliderRotate: false,
                sliderButtonIcon: Image.asset(
                  AssetsImages.ligticon,
                  width: 24.w,
                ),
                innerColor: logtextcolor,
                animationDuration: Duration(seconds: 3),
                reversed: false,
                outerColor: lgbackgoundcolor, // yellow color set correctly
              ),
            ],
          ),
        ),
      ),
    );
  }
}
