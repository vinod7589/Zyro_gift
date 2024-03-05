import 'package:abc/src/view/mobile_view/bottomNavigationBar_tabs/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer/MyCard_page.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            130.verticalSpace,
            Image.asset(
              'assets/images/successful.png',
              height: 167,
            ),
            20.verticalSpace,
            const Text(
              'Your purchase was',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.34,
              ),
            ),
            const Text(
              'successful',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.40,
              ),
            ),
            30.verticalSpace,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyCardPage(
                              isfrombottom: true,
                            )),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 110.w,
                  height: 51.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF8C8C8C)),
                      borderRadius: BorderRadius.circular(66),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                    ),
                  ),
                ),
              ),
              14.horizontalSpace,
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 163.w,
                  height: 51.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF8C8C8C)),
                      borderRadius: BorderRadius.circular(66),
                    ),
                  ),
                  child: Text(
                    'Buy another',
                    style: TextStyle(
                      color: const Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                    ),
                  ),
                ),
              )
            ]),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
