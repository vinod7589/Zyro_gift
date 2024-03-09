import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPlanPage extends StatelessWidget {
  const ConfirmPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Container(
                          alignment: Alignment.center,
                          width: 46.w,
                          height: 46.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF2F2F2),
                            shape: OvalBorder(),
                          ),
                          child: Image.asset(
                            'assets/images/bill-payments/airtel.png',
                            height: 25.h,
                          ),
                        ),
                        14.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Recharge',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.16,
                              ),
                            ),
                            Text(
                              'Prepaid - Delhi NCR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.10,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 18, top: 20),
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: const Color(0xFFA72E81),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.12,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Color(0xFF303030),
            ),
            30.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: ShapeDecoration(
                color: Color(0xFF1B1B1B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Column(
                children: [
                  Text(
                    '₹ 2,999',
                    style: TextStyle(
                      color: Color(0xFFE1E1E1),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF303030),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: TextStyle(
                                color: Color(0xFFE1E1E1),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              '2.5 GB per day',
                              style: TextStyle(
                                color: Color(0xFFE1E1E1),
                                fontSize: 16.54.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        20.horizontalSpace,
                        Container(
                          height: 83.01,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF303030),
                              ),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Valadity',
                              style: TextStyle(
                                color: Color(0xFFE1E1E1),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              '365 day',
                              style: TextStyle(
                                color: Color(0xFFE1E1E1),
                                fontSize: 16.54.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  19.verticalSpace,
                  Padding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calls : Unlimited local STD & Roaming',
                          style: TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        12.verticalSpace,
                        Text(
                          'SMS : 100/Days Validity : 28 days',
                          style: TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        12.verticalSpace,
                        Text(
                          'Details : Disney+ Hotstar Mobile subscription for 1 year, Unlimited 5G data ( over & above plan limit)',
                          style: TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(left: 22, right: 15),
                  )
                ],
              ),
            ),
            Spacer(),
            ButtonAnimationWidget(
              width: 314.w,
              title: 'Proceed To Pay',
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
