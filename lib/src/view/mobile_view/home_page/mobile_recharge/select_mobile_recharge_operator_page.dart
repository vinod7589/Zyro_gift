import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';

class SelectOperatorPage extends StatefulWidget {
  const SelectOperatorPage({super.key});

  @override
  State<SelectOperatorPage> createState() => _SelectOperatorPageState();
}

class _SelectOperatorPageState extends State<SelectOperatorPage> {
  List<Map<String, dynamic>> selectOperators = [
    {
      'title': 'Airtel Prepaid',
      'image': 'assets/images/bill-payments/airtel-operator.png'
    },
    {'title': 'MTNL Prepaid', 'image': 'assets/images/bill-payments/mtnl.png'},
    {
      'title': 'Jio Prepaid',
      'image': 'assets/images/bill-payments/jio-operator.png'
    },
    {'title': 'BSNL Prepaid', 'image': 'assets/images/bill-payments/bsnl.png'},
    {'title': 'Vi Prepaid', 'image': 'assets/images/bill-payments/mtnl.png'},
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
                Container(
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
                        'Select Operator',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.18,
                        ),
                      ),
                    ],
                  ),
                ),
                20.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child:
                      Image.asset('assets/images/bharat-pay.png', height: 40.h),
                )
              ],
            ),
            Divider(
              color: dividerColor,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 18),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                      transformAlignment: Alignment(200, 100),
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
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
