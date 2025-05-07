import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/widgets/chat_bubbles.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("John Doe", style: Theme.of(context).textTheme.bodyLarge),
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
            ChatBubbles(
              message: "You look over the entire location from this!",
              iscoming: true,
              time: "10:30",
              status: "Read",
              imageUrl: "",
            ),

            // Second message (outgoing)
            ChatBubbles(
              message: "We have four cars in a team",
              iscoming: false,
              time: "10:32",
              status: "Read",
              imageUrl: "",
            ),

            // Third message (outgoing)
            ChatBubbles(
              message: "We took them two cars",
              iscoming: false,
              time: "10:32",
              status: "Read",
              imageUrl: "",
            ),

            // Fourth message (incoming)
            ChatBubbles(
              message: "Electric net record had traction paid",
              iscoming: true,
              time: "10:35",
              status: "Read",
              imageUrl: "",
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
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AssetsImages.sendimages, width: 25.w),
            ),
          ],
        ),
      ),
    );
  }
}
