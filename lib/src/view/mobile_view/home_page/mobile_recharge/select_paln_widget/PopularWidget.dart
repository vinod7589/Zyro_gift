import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../confirm_plan_page.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: NavigatorPush(
        title: ConfirmPlanPage(),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 14),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: ShapeDecoration(
                  color: Color(0xFF1B1B1B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Padding(
                  padding: pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹ 2,999',
                            style: TextStyle(
                              color: Color(0xFFE1E1E1),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 28,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data',
                                style: TextStyle(
                                  color: Color(0xFFE1E1E1),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '2.0 GB per day',
                                style: TextStyle(
                                  color: Color(0xFFE1E1E1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 28,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Validity',
                                style: TextStyle(
                                  color: Color(0xFFE1E1E1),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '365 day',
                                style: TextStyle(
                                  color: Color(0xFFE1E1E1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Text(
                        'Calls : Unlimited Data  |  1GB/Day  |  SMS : 100/Days ',
                        style: TextStyle(
                          color: Color(0xFFE1E1E1),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
