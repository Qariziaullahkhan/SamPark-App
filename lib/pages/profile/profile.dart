import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/config/colors.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/widgets/mysize.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.h, vertical: 10.h),
            padding: EdgeInsets.all(15.sp),
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsImages.girlimages,
                            height: 80.h,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("malikziakhan0315@gmail.com",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Mysize(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Malik Zia Khan",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      Mysize(
                        height: 15.h,
                      ),
                      Row(
                        // This is the only changed section
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: lgbluecolor,
                                  size: 20.w,
                                ),
                                Mysize(width: 15.w),
                                Text(
                                  "Call",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: lgbluecolor),
                                )
                              ],
                            ),
                          ),
                          Mysize(width: 5.w),
                          Container(
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AssetsImages.logoPNG,
                                  width: 20.w,
                                  color: lgprimarycolor,
                                ),
                                Mysize(width: 15.w),
                                Text(
                                  "Chat",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: lgprimarycolor),
                                )
                              ],
                            ),
                          ),
                          Mysize(width: 5.w),
                          Container(
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: lgredcolor,
                                  size: 20.w,
                                ),
                                Mysize(width: 5.w),
                                Text(
                                  "Delete",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: lgredcolor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
