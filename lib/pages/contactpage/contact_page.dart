import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/controller/chat_controller.dart';
import 'package:sampark_app/controller/contact_controller.dart';
import 'package:sampark_app/pages/chat/chat_page.dart';
import 'package:sampark_app/pages/chat/chat_title.dart';
import 'package:sampark_app/widgets/contact.dart';
import 'package:sampark_app/widgets/mysize.dart';
import 'package:sampark_app/widgets/new_contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isearch = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Select Contact",
            style: Theme.of(context).textTheme.headlineSmall),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  isearch.value = !isearch.value;
                },
                icon: isearch.value ? Icon(Icons.close) : Icon(Icons.search)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: ListView(
          children: [
            Obx(
              () => isearch.value ? ContactSearch() : SizedBox(),
            ),
            Mysize(
              height: 23.h,
            ),
            NewContactTile(
              btnname: 'New Contact',
              icon: Icons.person_add,
              onTap: () {},
            ),
            Mysize(
              height: 16.h,
            ),
            NewContactTile(
              btnname: 'New Group',
              icon: Icons.group_add,
              onTap: () {},
            ),
            Mysize(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Select Contact from',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
              ],
            ),
            Mysize(
              height: 18.h,
            ),
            Obx(
              () => Column(
                  children: contactController.userList
                      .map((value) => InkWell(
                            onTap: () {
                              Get.toNamed('/chatpage', arguments: value);
                              String roomId =
                                  chatController.getRoomId(value.id!);
                              print(roomId);
                              print("user tapped ${value.name}");
                            },
                            child: ChatTitle(
                              imageUrl: value.profileImage ??
                                  AssetsImages.defaultprofile,
                              name: value.name ?? "",
                              lastChat: value.about ?? " No Message",
                              lastTime: value.status ?? " No Time",
                            ),
                          ))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
