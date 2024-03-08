import 'package:abc/src/constants/color.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/home_page/mobile_recharge/select_plan_page.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterMobileNumberPage extends StatelessWidget {
  const EnterMobileNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(
                          'Mobile Recharge',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 5),
                  child:
                      Image.asset('assets/images/bharat-pay.png', height: 40.h),
                )
              ],
            ),
            const Divider(
              color: Color(0xFF303030),
            ),
            20.verticalSpace,
            Padding(
              padding: pagePadding,
              child: Column(
                children: [
                  AppTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text.length == 10) {
                        FocusScope.of(context).unfocus();
                        // sendOtp();
                      }
                    },
                    textColor: Colors.white,
                    borderColor: textFieldBorderColor,
                    fillColor: backGroundColor,
                    hintstyle: const TextStyle(
                      color: Color(0xFFB5B5B5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Enter 10 digit number',
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Select Contact',
                        style: TextStyle(
                          color: Color(0xFFCACACA),
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                      13.horizontalSpace,
                      Expanded(
                        child: Divider(
                          color: dividerColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: pagePadding,
                physics: PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: null,
                itemBuilder: (context, index) {
                  return NavigatorPush(
                    title: SelectPlanPage(),
                    child: Column(
                      children: [
                        25.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 45.w,
                              height: 45.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF5F5F5F),
                                shape: OvalBorder(),
                              ),
                              child: Text(
                                'AS',
                                style: TextStyle(
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 14.48,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            14.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 240.w,
                                  child: Text(
                                    'Devvrat Chauhan',
                                    style: TextStyle(
                                      color: Color(0xFFEFEFEF),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                1.verticalSpace,
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    '7017530723',
                                    style: TextStyle(
                                      color: Color(0xFFB5B5B5),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
