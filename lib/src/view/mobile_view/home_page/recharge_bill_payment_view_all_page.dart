import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Packages/animated_textfield/animated_hint_textfield.dart';
import '../../../constants/height.dart';

class RechargeBillPaymentViewAllPage extends StatelessWidget {
  const RechargeBillPaymentViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
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
                        hintTextStyle: TextStyle(color: Colors.white60),
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
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF545454)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            contentPadding: const EdgeInsets.only(
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

                            hintStyle: const TextStyle(
                              color: Color(0xFFB5B5B5),
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: "Search for Brands",
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide:
                                    BorderSide(color: Color(0xFF545454))))),
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
          ],
        ),
      ),
    );
  }
}
