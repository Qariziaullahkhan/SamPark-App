import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  double? width;
  double? height;
  PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
