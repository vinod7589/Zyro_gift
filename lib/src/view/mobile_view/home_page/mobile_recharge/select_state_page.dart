import 'package:abc/src/constants/color.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/home_page/mobile_recharge/select_plan_page.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectStatePage extends StatefulWidget {
  const SelectStatePage({super.key});

  @override
  State<SelectStatePage> createState() => _SelectStatePageState();
}

class _SelectStatePageState extends State<SelectStatePage> {
  List<String> stateName = [
    'Andaman',
    'Andhra pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland ',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

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
                          'Select Region',
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 52.h,
                    child: AppTextField(
                      textColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.h,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      borderColor: textFieldBorderColor,
                      hintstyle: TextStyle(
                        color: const Color(0xFFB5B5B5),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: Colors.transparent,
                      hintText: 'Search  for a plan',
                      prefixIcon: SizedBox(
                        height: 17.h,
                        width: 17.w,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            'assets/images/bill-payments/search.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                25.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'All States',
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
                ),
              ],
            ),
            // 10.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                shrinkWrap: true,
                padding: pagePadding,
                // physics: PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return NavigatorPush(
                    title: SelectPlanPage(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        children: [
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                stateName[index],
                                style: TextStyle(
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ],
                      ),
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
