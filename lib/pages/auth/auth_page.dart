import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/config/strings.dart';
import 'package:sampark_app/widgets/authpagebody.dart';
import 'package:sampark_app/widgets/mysize.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Mysize(
              height: 48.h,
            ),
            Center(
              child: Image.asset(AssetsImages.logoPNG),
            ),
            Mysize(
              height: 4.h,
            ),
            Text(
              AppsStrings.appName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Mysize(
              height: 81.h,
            ),
            AuthPageBody(),
          ],
        ),
      ),
    );
  }
}
