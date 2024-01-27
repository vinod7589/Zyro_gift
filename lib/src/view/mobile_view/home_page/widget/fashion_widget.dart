import 'package:abc/src/controller/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utility/constants.dart';
import '../home_items_page/card_details_page.dart';

class FashionWidget extends ConsumerWidget {
  const FashionWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var fashionController = ref.watch(HomePageController(''));
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 10, top: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Amazing Fashion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.80,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.36,
            ),
          ),
          3.verticalSpace,
          Row(
            children: [
              const Text(
                'Discount',
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
          20.verticalSpace,
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String originalString =
                    fashionController.fashionList[index].brandName.toString();

                // Initialize trimmedString with the original string
                String trimmedString = originalString;
                bool isannual = false;
                bool iscontain = false;
                // Check if the string contains "- Annual" or "- Luxe"
                if (originalString.contains('- Annual') ||
                    originalString.contains('- Luxe')) {
                  // Split the string based on the separator '- Annual' or '- Luxe'
                  if (originalString.contains('- Annual')) {
                    List<String> parts =
                        originalString.split('- Annual').toList();
                    isannual = true;
                    // Take the first part, which is everything before '- Annual' or '- Luxe'
                    trimmedString = parts[0];
                  } else if (originalString.contains('- Luxe')) {
                    List<String> parts =
                        originalString.split('- Luxe').toList();
                    // Take the first part, which is everything before '- Annual' or '- Luxe'
                    trimmedString = parts[0];
                  }

                  iscontain = true;
                }
                return GestureDetector(
                  onTap: () {
                    String branCode = fashionController
                        .allPopularBrands[index].brandCode
                        .toString();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CardDetailsPage(brandCode: branCode)));
                  },
                  child: Row(
                    children: [
                      Image.network(
                        baseUrl +
                            fashionController.fashionList[index].defaultImage
                                .toString(),
                        height: 140.h,
                      ),
                      20.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // width: 160,
                                child: Text(
                                  trimmedString,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.09,
                                  ),
                                ),
                              ),
                              3.verticalSpace,
                              iscontain == false
                                  ? SizedBox()
                                  : SizedBox(
                                      child: Text(
                                        isannual == true
                                            ? '(Annual Subscription)'
                                            : '(Luxe Gift Card)',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9.95.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.09,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          3.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Fashion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.06,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: 3.h,
                                width: 3.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                              Text(
                                fashionController
                                    .fashionList[index].redemptionProcess
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.06,
                                ),
                              ),
                            ],
                          ),
                          9.verticalSpace,
                          Row(
                            children: [
                              Text(
                                fashionController.fashionList[index].discount
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
                );
              },
              separatorBuilder: (context, index) => 20.verticalSpace,
              itemCount: fashionController.fashionList.length),
        ],
      ),
    );
  }
}
