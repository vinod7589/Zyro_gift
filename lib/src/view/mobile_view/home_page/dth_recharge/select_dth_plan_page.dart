import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';
import '../../../widgets/botton_animation_widget.dart';

class SelectDthPlanPage extends StatelessWidget {
  final String operatorName;
  final String image;

  const SelectDthPlanPage(
      {super.key, required this.image, required this.operatorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //////////////////////////////Appbar//////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      'DTH Recharge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ],
                ),
                20.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child:
                      Image.asset('assets/images/bharat-pay.png', height: 40.h),
                )
              ],
            ),
            const Divider(
              color: dividerColor,
            ),
/////////////////////////////////////appBar
            10.verticalSpace,
            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1B1B1B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              image,
                              height: 50.h,
                            ),
                            20.horizontalSpace,
                            Text(
                              operatorName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.14,
                              ),
                            )
                          ],
                        ),
                        16.verticalSpace,
                        const Divider(
                          indent: 21,
                          endIndent: 21,
                          color: dividerColor,
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Customer ID',
                              style: TextStyle(
                                color: const Color(0xFFEAEAEA),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '9689999869',
                              style: TextStyle(
                                color: const Color(0xFFEAEAEA),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        11.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Customer Name',
                              style: TextStyle(
                                color: const Color(0xFFEAEAEA),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              width: 160,
                              child: Text(
                                'Himansu Kumar Maurya    .',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: const Color(0xFFEAEAEA),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  25.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Amount to pay',
                      style: TextStyle(
                        color: const Color(0xFFF0F0F0),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  const AppTextField(
                    keyboardType: TextInputType.number,
                    borderColor: textFieldBorderColor,
                    fillColor: Colors.transparent,
                    hintstyle: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Enter amount',
                  )
                ],
              ),
            ),
            const Spacer(),
            AnimationButton(
              onPress: () {},
              width: 314.w,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              title: 'Continue',
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
