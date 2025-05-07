import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/widgets/mysize.dart';

class ChatTitle extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String time;

  const ChatTitle({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastChat,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/chatpage');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(imageUrl, width: 50.w, height: 50.h),
                Mysize(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.bodyLarge),
                    Mysize(height: 5.h),
                    Text(lastChat,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
            Text(time, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
