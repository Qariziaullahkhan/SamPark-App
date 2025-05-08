import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/controller/profile_controller.dart';
import 'package:sampark_app/widgets/mysize.dart';
import 'package:sampark_app/widgets/primary_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    RxBool isedit = false.obs;
    TextEditingController nameController =
        TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController =
        TextEditingController(text: profileController.currentUser.value.phone);
    TextEditingController aboutController =
        TextEditingController(text: profileController.currentUser.value.about);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Mysize(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 80.r,
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              child: Icon(
                                Icons.image,
                              ),
                            ),
                          ],
                        ),
                        Mysize(
                          height: 10.h,
                        ),
                        Obx(
                          () => TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              enabled: isedit.value,
                              filled: isedit.value,
                              hintText: "Name",
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Mysize(height: 10.h), // Added gap
                        Obx(
                          () => TextField(
                            controller: aboutController,
                            decoration: InputDecoration(
                              enabled: isedit.value,
                              filled: isedit.value,
                              hintText: "About",
                              labelText: "About",
                              prefixIcon: Icon(Icons.info),
                            ),
                          ),
                        ),
                        Mysize(height: 10.h), // Added gap
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            enabled: isedit.value,
                            filled: isedit.value,
                            hintText: "Email",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        Mysize(height: 10.h), // Added gap
                        Obx(
                          () => TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              enabled: isedit.value,
                              filled: isedit.value,
                              hintText: "Phone",
                              labelText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Mysize(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isedit.value
                                  ? PrimaryButton(
                                      text: "Save",
                                      onPressed: () {
                                        isedit.value = false;
                                      },
                                      icon: Icons.save,
                                    )
                                  : PrimaryButton(
                                      text: "Edit",
                                      onPressed: () {
                                        isedit.value = true;
                                      },
                                      icon: Icons.edit,
                                    ),
                            )
                          ],
                        ),
                        Mysize(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
