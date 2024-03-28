import 'package:abc/src/constants/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrepaidCardPage extends StatelessWidget {
  const PrepaidCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/bill-payments/cardimage.png',
                ),
                9.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/bill-payments/cvv.png',
                              height: 17,
                            ),
                            8.horizontalSpace,
                            Text(
                              'CVV',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Issued by Pine labs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.08,
                        ),
                      )
                    ],
                  ),
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹ ' + '3,00,000',
                      style: TextStyle(
                        color: Color(0xFF13C782),
                        fontSize: 17.85.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                    10.horizontalSpace,
                    Image.asset(
                      'assets/images/bill-payments/retry.png',
                      height: 18,
                    )
                  ],
                ),
                15.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Color(0xFF3A363F),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/bill-payments/top-up.png',
                              height: 23.h,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Top up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Color(0xFF3A363F),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/bill-payments/freeze.png',
                              height: 23.h,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Freeze',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Color(0xFF3A363F),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/bill-payments/add-card.png',
                              height: 23.h,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Add Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Color(0xFF3A363F),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/bill-payments/more.png',
                              height: 23.h,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'More',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                25.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 144,
                      child: Text(
                        'Recent Transaction',
                        style: TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1F1F1F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.20,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
