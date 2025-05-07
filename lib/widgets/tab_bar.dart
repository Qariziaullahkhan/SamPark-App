import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

myTabBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(48.h),
    child: Container(
      color: Theme.of(context)
          .colorScheme
          .onPrimaryContainer, // Match app bar color
      padding: EdgeInsets.all(8.sp),
      child: TabBar(
        indicatorWeight: 4.w,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Theme.of(context)
            .colorScheme
            .primary, // Primary color for indicator
        labelColor: Theme.of(context)
            .colorScheme
            .primary, // Primary color for selected tab
        unselectedLabelColor: Colors.grey, // Color for unselected tabs
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        tabs: const [
          Tab(text: "Chats"),
          Tab(text: "Groups"),
          Tab(text: "Calls"),
        ],
      ),
    ),
  );
}
