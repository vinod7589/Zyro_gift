import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  final String title;
  final String image;
  final double height;

  const MyContainer(
      {required this.title, required this.image, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            height: 58.h,
            width: 58.w,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xFF3C3C3C), width: 1.5),
                borderRadius: BorderRadius.circular(30)),
            child: Image.asset(
              'assets/images/bill-payments/$image',
              height: height.h,
            )),
        8.verticalSpace,
        SizedBox(
          height: 36.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
