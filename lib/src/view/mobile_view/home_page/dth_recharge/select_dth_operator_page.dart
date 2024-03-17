import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/view/mobile_view/home_page/dth_recharge/confirm_dth_operator_plan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';

class SelectDthOperatorPage extends StatefulWidget {
  const SelectDthOperatorPage({super.key});

  @override
  State<SelectDthOperatorPage> createState() => _SelectDthOperatorPageState();
}

class _SelectDthOperatorPageState extends State<SelectDthOperatorPage> {
  List<Map<String, dynamic>> selectOperators = [
    {'title': 'Dish TV', 'image': 'assets/images/bill-payments/dishtv.png'},
    {'title': 'd2h', 'image': 'assets/images/bill-payments/d2h.png'},
    {
      'title': 'Tata Play',
      'image': 'assets/images/bill-payments/tata-play.png'
    },
    {
      'title': 'Airtel Digital TV',
      'image': 'assets/images/bill-payments/airtel-digital-tv.png'
    },
    {
      'title': 'Sun Direct',
      'image': 'assets/images/bill-payments/sun-direct.png'
    },
  ];
  bool startAnimation = false;

  void listViewAnimation() {
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  void initState() {
    listViewAnimation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: ConfirmDthOperatorPage(
                            operatorName: selectOperators[index]['title'],
                            image: selectOperators[index]['image'],
                          ),
                          type: PageTransitionType.theme,
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      transform: Matrix4.translationValues(
                        startAnimation
                            ? 0
                            : MediaQuery.of(context)
                                .size
                                .width, // Off-screen right
                        0,
                        0,
                      ),
                      transformAlignment: const Alignment(200, 100),
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 300 + (index * 100)),
                      height: 75.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Image.asset(
                                  '${selectOperators[index]['image']}',
                                  height: 50.h,
                                ),
                                20.horizontalSpace,
                                Text(
                                  '${selectOperators[index]['title']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ); // Replace YourChildWidget with your actual widget
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
