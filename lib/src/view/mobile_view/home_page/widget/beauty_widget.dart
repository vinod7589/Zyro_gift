import 'package:abc/src/controller/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utility/constants.dart';
import '../home_items_page/card_details_page.dart';

class BeautyWidget extends ConsumerWidget {
  const BeautyWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var beautyController = ref.watch(HomePageController(''));
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: const Text(
              'Beauty on a budget',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.80,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.36,
              ),
            ),
          ),
          3.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              children: [
                const Text(
                  'fantastic discounts!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.27,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors
                              .transparent, // Set border color to transparent
                        ),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(1.00, 0.01),
                        end: Alignment(-1, -0.01),
                        colors: [Color(0x00EDEDED), Color(0xFFE6E6E6)],
                      )),
                )),
              ],
            ),
          ),
          30.verticalSpace,
          Container(
            height: 260,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index < beautyController.beautyList.length) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          String branCode = beautyController
                              .beautyList[index].brandCode
                              .toString();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardDetailsPage(
                                        brandCode: branCode,
                                      )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              baseUrl +
                                  beautyController
                                      .beautyList[index].additionalImage
                                      .toString(),
                              height: 140,
                            ),
                            20.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                12.verticalSpace,
                                Text(
                                  beautyController.beautyList[index].brandName
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.95.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.09,
                                  ),
                                ),
                                // 3.verticalSpace,
                                Row(
                                  children: [
                                    Text(
                                      // homePage.beautyBudgetList[index]
                                      //         .brandName
                                      //         .toString() +
                                      'Beauty . ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.06,
                                      ),
                                    ),
                                    Text(
                                      'offline', // homePage
                                      //     .beautyBudgetList[index].type
                                      //     .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.06,
                                      ),
                                    ),
                                  ],
                                ),
                                3.verticalSpace,
                                Row(
                                  children: [
                                    Text(
                                      beautyController
                                          .beautyList[index].discount
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF00A91B),
                                        fontSize: 18.95,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.09,
                                      ),
                                    ),
                                    const Text(
                                      '% off',
                                      style: TextStyle(
                                        color: Color(0xFF00A91B),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.06,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: 7),
          ),
        ],
      ),
    );
  }
}
