import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color.dart';

void askLocationDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      // title: Text("Location Access"),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 416.h),
        child: Column(
          children: [
            Text(
              "Location Access",
              style: TextStyle(
                  fontSize: 20.sp, color: primary, fontWeight: FontWeight.w500),
            ),
            33.verticalSpace,
            Image.asset(
              'assets/images/location.png',
              height: 130.h,
            ),
            26.verticalSpace,
            const Text(
              'Enable precise location',
              style: TextStyle(color: primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(
                width: 231.w,
                child: Text(
                  'Your location will be used to show you personalised information',
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                )),
            21.verticalSpace,
            ElevatedButton(
              onPressed: onPressed ?? () {},
              child: const Text('Allow'),
            )
          ],
        ),
      ),
    ),
  );
}
