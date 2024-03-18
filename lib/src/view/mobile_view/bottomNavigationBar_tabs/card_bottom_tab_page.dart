import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBottomTabPage extends StatelessWidget {
  const CardBottomTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/images/bill-payments/prepaid-card.png',
              ),
              Positioned(
                bottom: 30,
                left: 25,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  height: 40.h,
                  width: 123.w,
                  child: Text(
                    'Apply Now ',
                    style: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
              )
            ]),
            30.verticalSpace,
            Text(
              'What’s included with your Prepaid card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
