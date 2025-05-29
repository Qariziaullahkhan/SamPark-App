import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/controller/chat_controller.dart';
import 'package:sampark_app/models/chat_model.dart';
import 'package:sampark_app/models/user_model.dart';
import 'package:sampark_app/widgets/chat_bubbles.dart';

class ChatPage extends StatelessWidget {
  final UserModel usermodel;
  const ChatPage({super.key, required this.usermodel});

  @override
  Widget build(BuildContext context) {
    final messagecontroller = TextEditingController();
    ChatController chatController = Get.put(ChatController());
    print("User ID: ${usermodel.id}");
    print("User Name: ${usermodel.name}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.sp),
          child: Image.asset(
            AssetsImages.boyimages,
            width: 20.w,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (usermodel.name != "Unknown User") ? usermodel.name! : "New User",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("Online", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.video_call_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // First message (incoming)
            // In body: Padding(...), replace Column children with:
            Expanded(
              child: StreamBuilder<List<ChatModel>>(
                stream: chatController.getMessages(usermodel.id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No messages yet"));
                  }

                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];
                      String formatedDate =
                          DateFormat('hh:mm a').format(DateTime.now());
                      return ChatBubbles(
                        message: message.message ?? "[No message]",
                        iscoming: message.receiverId ==
                            chatController.auth.currentUser?.uid,
                        time: formatedDate,
                        status: "read",
                        imageUrl:
                            message.imageUrl ?? AssetsImages.defaultprofile,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AssetsImages.micimages, width: 25.w),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                controller: messagecontroller,
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Type a message",
                ),
              ),
            ),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AssetsImages.galleryimages, width: 25.w),
            ),
            InkWell(
              onTap: () {
                if (messagecontroller.text.isNotEmpty) {
                  chatController.sendMessage(
                      usermodel.id!, messagecontroller.text);
                  messagecontroller.clear();
                }
              },
              child: SizedBox(
                width: 30.w,
                height: 30.h,
                child: Image.asset(AssetsImages.sendimages, width: 25.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
