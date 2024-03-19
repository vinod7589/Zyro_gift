import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../card_page/widget/privacy_policy_widget.dart';

class CardBottomTabPage extends StatefulWidget {
  const CardBottomTabPage({super.key});

  @override
  State<CardBottomTabPage> createState() => _CardBottomTabPageState();
}

class _CardBottomTabPageState extends State<CardBottomTabPage> {
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Theme(
                            data: ThemeData(
                              fontFamily: 'Poppins',
                              useMaterial3: false,
                            ),
                            child: AlertDialog(
                                // actionsPadding: EdgeInsets.zero,
                                insetPadding: EdgeInsets.symmetric(vertical: 0),
                                // iconPadding: EdgeInsets.zero,
                                // buttonPadding: EdgeInsets.zero,
                                // titlePadding: EdgeInsets.symmetric(
                                //     horizontal: 10, vertical: 20),
                                contentPadding: EdgeInsets.only(
                                  right: 20,
                                  bottom: 40,
                                  top: 10,
                                ),
                                backgroundColor: Color(0xFF1E1E1E),
                                content: CardPrivacyPolicyPage()));
                      },
                    );
                  },
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF313131),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/bill-payments/track-spending.png',
                          height: 28.h,
                        ),
                      ),
                      8.verticalSpace,
                      SizedBox(
                        width: 65,
                        child: Text(
                          'Track your Spending',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFB8B8B8),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.11,
                          ),
                        ),
                      )
                    ],
                  ),
                  25.horizontalSpace,
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF313131),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/bill-payments/protected.png',
                          height: 28.h,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Easy & Protected \nTransactions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFB8B8B8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.11,
                        ),
                      )
                    ],
                  ),
                  25.horizontalSpace,
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF313131),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/bill-payments/reload-needed.png',
                          height: 28.h,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Reload as\n Needed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFB8B8B8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.11,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
