import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/widgets/mysize.dart';

class NewContactTile extends StatelessWidget {
  final String btnname;
  final IconData icon;
  final VoidCallback onTap;

  const NewContactTile(
      {super.key,
      required this.btnname,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(10.sp),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: Color(0xFF0057FF),
              ),
            ),
            Mysize(width: 10.w),
            Text(
              btnname,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
