import 'package:abc/src/constants/color.dart';
import 'package:abc/src/view/mobile_view/home_page/mobile_recharge/select_operator_page.dart';
import 'package:abc/src/view/mobile_view/home_page/mobile_recharge/select_paln_widget/PopularWidget.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPlanPage extends StatelessWidget {
  const SelectPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            3.verticalSpace,
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
                              '7017530723',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.18,
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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 0,
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: const Color(0xFF2C2C2C),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      )),
                      builder: (context) =>
                          Consumer(builder: (context, ref, child) {
                        return StatefulBuilder(builder: (context, f) {
                          return Container(
                            decoration: BoxDecoration(
                                color: backGroundColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    topLeft: Radius.circular(24.r))),
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Operator Details',
                                        style: TextStyle(
                                          color: Color(0xFFE1E1E1),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          'assets/images/bill-payments/close.png',
                                          height: 40.h,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                30.verticalSpace,
                                NavigatorPush(
                                  title: SelectOperatorPage(),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 22),
                                    width: 351,
                                    height: 68,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF1B1B1B),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Airtel Prepaid',
                                          style: TextStyle(
                                            color: Color(0xFFE1E1E1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
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
                                ),
                                17.verticalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 22),
                                  height: 68.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF1B1B1B),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Delhi NCR',
                                        style: TextStyle(
                                          color: Color(0xFFE1E1E1),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
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
                                30.verticalSpace,
                              ],
                            ),
                          );
                        });
                      }),
                    );
                  },
                  child: Padding(
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
                  ),
                )
              ],
            ),
            const Divider(
              color: Color(0xFF303030),
            ),
            25.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
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
            30.verticalSpace,
            const Expanded(
              child: DefaultTabController(
                initialIndex: 0,
                length: 5,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      isScrollable: true,
                      unselectedLabelColor: Color(0xFFD6D6D6),
                      indicatorColor: Colors.white,
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      dividerColor: dividerColor,
                      tabs: <Widget>[
                        Tab(icon: Text('Popular')),
                        Tab(icon: Text('Smart Phone')),
                        Tab(icon: Text('Data Add on')),
                        Tab(icon: Text('Data Add on')),
                        Tab(icon: Text('Yearly Plans')),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          PopularWidget(),
                          Center(child: Text("It's rainy here")),
                          Center(child: Text("It's sunny here")),
                          Center(child: Text("It's sunny here")),
                          Center(child: Text("It's sunny here")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
