import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/strings.dart';
import 'package:sampark_app/pages/auth/login_form.dart';
import 'package:sampark_app/pages/auth/signup_form.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool islogin = true.obs; // Changed default to true for login
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Obx(
        () => Column(
          children: [
            // Login/Signup Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Login Tab
                  InkWell(
                    onTap: () {
                      islogin.value = true;
                    },
                    child: Column(
                      children: [
                        Text(
                          AppsStrings.login,
                          style: islogin.value
                              ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                              : Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: 8.h),
                        AnimatedContainer(
                          width: islogin.value ? 100.w : 0,
                          height: 3.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),

                  // Signup Tab
                  InkWell(
                    onTap: () {
                      islogin.value = false;
                    },
                    child: Column(
                      children: [
                        Text(
                          AppsStrings.signup,
                          style: !islogin.value
                              ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                              : Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: 8.h),
                        AnimatedContainer(
                          width: !islogin.value ? 100.w : 0,
                          height: 3.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Obx(() => islogin.value ? LoginForm() : SignUpForm()),
          ],
        ),
      ),

      // loginform

      // loginform
    );
  }
}
