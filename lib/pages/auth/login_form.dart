import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(height: 36.h),
          // Email Field
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email_outlined),
              hintText: 'Email',
              fillColor: Color(0xFF191B28),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 36.h),

          // Password Field
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              fillColor: Color(0xFF191B28),
              filled: true,
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 43.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                  text: "Login",
                  onPressed: () {
                    Get.toNamed("/homepage");
                  },
                  icon: Icons.lock_open_sharp),
            ],
          ),
        ],
      ),
    );
  }
}
