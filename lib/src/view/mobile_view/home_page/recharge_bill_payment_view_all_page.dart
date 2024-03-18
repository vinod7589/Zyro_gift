import 'package:abc/src/view/mobile_view/home_page/mobile_recharge/enter_mobile_number_page.dart';
import 'package:abc/src/view/mobile_view/widgets/mycontainer.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Packages/animated_textfield/animated_hint_textfield.dart';
import '../../../constants/height.dart';
import '../../../constants/page_padding.dart';
import '../bottomNavigationBar_tabs/card_bottom_tab_page.dart';
import 'dth_recharge/select_dth_operator_page.dart';

class RechargeBillPaymentViewAllPage extends StatelessWidget {
  const RechargeBillPaymentViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
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
                  Expanded(
                    child: SizedBox(
                      height: Height.SearchBarHeight,
                      child: AnimatedTextField(
                          animationType: Animationtype.typer,
                          // animationDuration: Duration(
                          //     milliseconds:
                          //         500), // Adjust the duration as needed
                          autocorrect: true,
                          hintTexts: [
                            'Search for Mobile Recharge',
                            'Search for FastTag',
                            'Search for Electricity',
                            'Search for Rent Payment',
                            'Search for Water',
                            'Search for Book a Cylinder',
                          ],
                          hintTextStyle:
                              TextStyle(color: Colors.white60, fontSize: 14.sp),
                          // autofocus: true,
                          // controller: filteredBrandPaginationProvider
                          //     .searchBarTextEditingController,
// isEnable = true;
//                 onChanged: (s) {
//                   filteredBrandPaginationProvider.search();
//                 },
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  borderSide:
                                      BorderSide(color: Color(0xFF545454))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF545454)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 10,
                                bottom: 8,
                              ),
                              // suffixIcon: filteredBrandPaginationProvider
                              //     .searchBarTextEditingController
                              //     .text
                              //     .isNotEmpty
                              //     ? Padding(
                              //   padding:
                              //   const EdgeInsets.only(right: 8),
                              //   child: IconButton(
                              //       onPressed: () {
                              //         // // isEnable = true;7
                              //         // filteredBrandPaginationProvider
                              //         //     .searchClear();
                              //         // FocusScope.of(context)
                              //         //     .unfocus();
                              //       },
                              //       icon: const Icon(
                              //         Icons.clear,
                              //         color: Colors.white70,
                              //       )),
                              // )
                              //     : Container(
                              //   width: 60,
                              //   padding: const EdgeInsets.all(13),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //         left: 0, right: 0),
                              //     child: Row(
                              //       crossAxisAlignment:
                              //       CrossAxisAlignment.start,
                              //       children: [
                              //         Image.asset(
                              //           'assets/images/Search.png',
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFFB5B5B5),
                                fontWeight: FontWeight.w400,
                              ),
                              // hintText: "Search for Brands",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  borderSide:
                                      BorderSide(color: Color(0xFF545454))))),
                    ),
                  ),
                  20.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/bharat-pay.png',
                        height: 40.h),
                  )
                ],
              ),
              21.verticalSpace,
              Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
                        'Recharges',
                        style: TextStyle(
                          color: const Color(0xFFA9A9A9),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF292929)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            NavigatorPush(
                              title: EnterMobileNumberPage(),
                              child: MyContainerWithBackgroundColor(
                                  title: 'Mobile\nRecharge',
                                  image: 'mobile-recharge.png',
                                  height: 34),
                            ),
                            20.horizontalSpace,
                            NavigatorPush(
                              title: SelectDthOperatorPage(),
                              child: MyContainerWithBackgroundColor(
                                  title: 'DTH/\nCable TV',
                                  image: 'dth.png',
                                  height: 34),
                            ),
                            20.horizontalSpace,
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => CardBottomTabPage()));
                              },
                              child: MyContainerWithBackgroundColor(
                                  title: 'FASTag\nRecharge',
                                  image: 'fastTag.png',
                                  height: 34),
                            ),
                            20.horizontalSpace,
                          ],
                        ),
                      ),
                    ),
                    23.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
                        'Housing & Utilities',
                        style: TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF292929)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyContainerWithBackgroundColor(
                                    title: 'Electricity',
                                    image: 'electricity-bill.png',
                                    height: 34),
                                MyContainerWithBackgroundColor(
                                    title: 'Water',
                                    image: 'water.png',
                                    height: 34),
                                MyContainerWithBackgroundColor(
                                    title: 'Postpaid',
                                    image: 'postpaid.png',
                                    height: 34),
                                MyContainerWithBackgroundColor(
                                    title: 'Piped Gas',
                                    image: 'piped-gas.png',
                                    height: 29),
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyContainerWithBackgroundColor(
                                    title: 'Rent\nPayment',
                                    image: 'rent-payment.png',
                                    height: 28),
                                MyContainerWithBackgroundColor(
                                    title: 'Broadband/\nLandline',
                                    image: 'broadband.png',
                                    height: 30),
                                MyContainerWithBackgroundColor(
                                    title: 'Book a\nCylinder',
                                    image: 'cylinder.png',
                                    height: 34),
                                MyContainerWithBackgroundColor(
                                    title: 'Education\nFees',
                                    image: 'education.png',
                                    height: 28),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    23.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
                        'Finance & Tax',
                        style: TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF292929)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyContainerWithBackgroundColor(
                                title: 'Hospital',
                                image: 'hospital.png',
                                height: 28),
                            MyContainerWithBackgroundColor(
                                title: 'Subscription',
                                image: 'subscription.png',
                                height: 32),
                            MyContainerWithBackgroundColor(
                                title: 'Recurring \nDeposit',
                                image: 'recurring-deposit.png',
                                height: 38),
                            MyContainerWithBackgroundColor(
                                title: 'Clubs &\nAssociation',
                                image: 'club.png',
                                height: 33),
                          ],
                        ),
                      ),
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
