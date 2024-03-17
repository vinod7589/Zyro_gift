import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/home_page/dth_recharge/select_dth_operator_page.dart';
import 'package:abc/src/view/mobile_view/home_page/dth_recharge/select_dth_plan_page.dart';
import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';

class ConfirmDthOperatorPage extends StatefulWidget {
  final String operatorName;
  final String image;

  const ConfirmDthOperatorPage(
      {super.key, required this.operatorName, required this.image});

  @override
  State<ConfirmDthOperatorPage> createState() => _ConfirmDthOperatorPageState();
}

class _ConfirmDthOperatorPageState extends State<ConfirmDthOperatorPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget.operatorName;
  //   print('name: ${widget.operatorName}');
  // }

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
            20.verticalSpace,
/////////////////////////////////////appBar
            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.88, color: Color(0xFF3C3C3C)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Operator',
                              style: TextStyle(
                                color: const Color(0xFFB5B5B5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            8.verticalSpace,
                            Text(
                              widget.operatorName,
                              style: TextStyle(
                                color: const Color(0xFFEAEAEA),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: const SelectDthOperatorPage(),
                                    type: PageTransitionType.theme));
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                              color: const Color(0xFF1670D9),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  17.verticalSpace,
                  AppTextField(
                    // textColor: Colors.red,
                    keyboardType: TextInputType.number,
                    borderColor: textFieldBorderColor,
                    fillColor: Colors.transparent,
                    hintstyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Registered Mobile/Viewing Card No.',
                  )
                ],
              ),
            ),
            const Spacer(),
            AnimationButton(
              onPress: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: SelectDthPlanPage(
                          image: widget.image,
                          operatorName: widget.operatorName,
                        ),
                        type: PageTransitionType.theme));
              },
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
