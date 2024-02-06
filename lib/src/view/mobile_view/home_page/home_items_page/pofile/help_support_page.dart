import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        titleSpacing: 5,
        title: Text(
          'Support',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          30.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            height: 159.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xFE2E2E2E)),
            child: Column(
              children: [
                23.verticalSpace,
                Image.asset(
                  'assets/images/supportnumber.png',
                  height: 55,
                ),
                15.verticalSpace,
                Text(
                  'Phone',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                5.verticalSpace,
                Text(
                  '+91 9311660676',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
          ),
          33.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            height: 159.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xFE2E2E2E)),
            child: Column(
              children: [
                23.verticalSpace,
                Image.asset(
                  'assets/images/supportemail.png',
                  height: 55,
                ),
                15.verticalSpace,
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                5.verticalSpace,
                Text(
                  'support@myzyro.com',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
