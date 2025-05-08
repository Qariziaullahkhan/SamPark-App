import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/controller/auth_controller.dart';
import 'package:sampark_app/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 36.h),
            // Email Field
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
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
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                if (value.length < 6) return 'Password too short';
                return null;
              },
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
            Obx(
              () => authController.isloading.value
                  ? CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButton(
                          text: "Login",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              authController.login(emailController.text,
                                  passwordController.text);
                              Get.toNamed("/homepage");
                            }
                          },
                          icon: Icons.lock_open_sharp,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
