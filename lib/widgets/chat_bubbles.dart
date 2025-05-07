import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/config/images.dart';

class ChatBubbles extends StatelessWidget {
  final String message;
  final bool iscoming;
  final String time;
  final String status;
  final String imageUrl;

  const ChatBubbles({
    super.key,
    required this.message,
    required this.iscoming,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          iscoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        /// Chat bubble container
        Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(
            minWidth: 100.h,
            maxWidth: 250.w,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp),
              bottomLeft: Radius.circular(iscoming ? 0.sp : 20.sp),
              bottomRight: Radius.circular(iscoming ? 20.sp : 0.sp),
            ),
          ),
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 14.sp),
          ),
        ),

        /// Spacing
        SizedBox(height: 5.h),

        Row(
          mainAxisAlignment:
              iscoming ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            iscoming
                ? Text(time)
                : Row(
                    children: [
                      Text(
                        time,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        AssetsImages.statusimages,
                        width: 20.w,
                      ),
                    ],
                  )
          ],
        ),

        /// Extra spacing below each bubble
        SizedBox(height: 10.h),
      ],
    );
  }
}
