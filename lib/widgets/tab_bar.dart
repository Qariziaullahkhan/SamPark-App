import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

myTabBar(TabController tabcontroller, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(48.h),
    child: Container(
      padding: EdgeInsets.all(8.sp),
      child: TabBar(
          controller: tabcontroller,
          indicatorWeight: 4.w,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
          tabs: [
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Groups",
            ),
            Tab(
              text: "Calls",
            ),
          ]),
    ),
  );
}
