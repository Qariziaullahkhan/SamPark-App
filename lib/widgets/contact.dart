import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Search Contact",
                border: InputBorder.none,
                isDense: true,
              ),
              onChanged: (value) {
                // You can handle filtering logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
