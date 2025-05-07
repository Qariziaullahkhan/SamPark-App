import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark_app/widgets/primary_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Full Name',
              fillColor: Color(0xFF191B28),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),

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
          SizedBox(height: 20.h),

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
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                  text: "Sign Up",
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
