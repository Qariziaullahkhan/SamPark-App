import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/colors.dart';
import 'package:sampark_app/controller/auth_controller.dart';
import 'package:sampark_app/controller/profile_controller.dart';
import 'package:sampark_app/pages/profile/profile.dart';
import 'package:sampark_app/pages/userprofile/login_user_info.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Profile());
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: Column(
        children: [
          LoginUserInfo(),
          Spacer(),
          SizedBox(
            child: TextButton(
              onPressed: () async {
                await authController.logoutuser();
              },
              child: Text(
                "Log Out",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: lgprimarycolor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
