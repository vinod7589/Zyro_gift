import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../prepaidCard_creditCard.dart';

class KycCompletePage extends StatelessWidget {
  const KycCompletePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Issued by',
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 9.64.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 12.05.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Pine Labs',
                  style: TextStyle(
                    color: Color(0xFF0E761E),
                    fontSize: 12.05.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            height: 500,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 110,
            ),
            width: double.maxFinite,
            height: 335,
            decoration: ShapeDecoration(
              color: Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF303030)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              children: [
                20.verticalSpace,
                Text(
                  'MIN KYC Completed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEDEDED),
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                11.verticalSpace,
                SizedBox(
                  width: 241,
                  child: Text(
                    'A physical card will be delivered on your address. Meanwhile explore your digital card.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 25,
              child: Image.asset(
                'assets/images/bill-payments/kyc-image.png',
                height: 195.h,
              )),
          Positioned(
            bottom: 110,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const PrepaidAndCreditCardPage(),
                        type: PageTransitionType.rightToLeft));
              },
              child: Container(
                alignment: Alignment.center,
                width: 148,
                height: 51,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'View Card',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
// Container(
// alignment: Alignment.center,
// width: 148,
// height: 51,
// decoration: ShapeDecoration(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(66),
// ),
// ),
// child: Text(
// 'View Card',
// style: TextStyle(
// color: Color(0xFF1D1D1D),
// fontSize: 16.sp,
// fontWeight: FontWeight.w600,
// ),
// ),
// ),
