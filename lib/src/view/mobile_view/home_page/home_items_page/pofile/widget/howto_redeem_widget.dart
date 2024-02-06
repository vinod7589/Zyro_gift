import 'dart:convert';

import 'package:abc/src/view/Utility/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../controller/home_page_controller.dart';
import '../../../../../../model/homePage/getbrand_details_model.dart';
import '../../../../../../model/redeem_step_model.dart';

class HowToRedeemWidget extends ConsumerStatefulWidget {
  const HowToRedeemWidget({required this.brandData});
  final String brandData;

  @override
  ConsumerState<HowToRedeemWidget> createState() => _HowToRedeemWidgetState();
}

class _HowToRedeemWidgetState extends ConsumerState<HowToRedeemWidget> {
  bool isExpended = false;

  List<RedeemStepEntityModel> redeemSteps = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.brandData! != "") {
        redeemSteps = (json.decode(widget.brandData!) as List)
            .map((jsonItem) => RedeemStepEntityModel.fromJson(jsonItem))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var redeemcontroller = ref.watch(HomePageController(widget.brandCode));
    return GestureDetector(
        onTap: () {
          isExpended = !isExpended;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(top: 15, left: 0, bottom: 6),
          // height: 160,
          decoration: ShapeDecoration(
            color: Color(0xFF2D2D2D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'How To Redeem',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Icon(
                      isExpended ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              if (isExpended) ...{
                const Padding(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Divider(
                    color: Color(0xFF454545),
                  ),
                ),
                10.verticalSpace,
                redeemSteps.length == 0
                    ? Text(
                        "No data available",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 15.sp),
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Text(
                                  '* ${redeemSteps[index].title}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins'),
                                ),
                                10.verticalSpace,
                                redeemSteps[index].image != ''
                                    ? Container(
                                        // height: 250,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            baseUrl +
                                                        redeemSteps[index]
                                                            .image !=
                                                    ''
                                                ? redeemSteps[index].image!
                                                : '',
                                            height: 150,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 30,
                            ),
                        itemCount: 2),
                10.verticalSpace,
                // Row(
                //   children: [
                //     // Image.asset(
                //     //   'assets/images/chekbox.png',
                //     //   height: 18,
                //     // ),
                //     const SizedBox(
                //       width: 13,
                //     ),
                //     // Expanded(
                //     //   child: Text(
                //     //     '${widget.brandData!.redeemSteps.toString()}',
                //     //     style: TextStyle(
                //     //       color: Colors.white,
                //     //       fontSize: 12.06,
                //     //       fontFamily: 'Urbanist',
                //     //       fontWeight: FontWeight.w400,
                //     //       letterSpacing: 0.24,
                //     //     ),
                //     //   ),
                //     // )
                //   ],
                // ),
                // 9.verticalSpace,
                // Row(
                //   children: [
                //     Image.asset(
                //       'assets/images/chekbox.png',
                //       height: 18,
                //     ),
                //     const SizedBox(
                //       width: 13,
                //     ),
                //     Expanded(
                //       child: const SizedBox(
                //         child: Text(
                //           'Use it to pay during checkout',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 12.06,
                //             fontFamily: 'Urbanist',
                //             fontWeight: FontWeight.w400,
                //             letterSpacing: 0.24,
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                9.verticalSpace,
                // Row(
                //   children: [
                //     Image.asset(
                //       'assets/images/chekbox.png',
                //       height: 18,
                //     ),
                //     const SizedBox(
                //       width: 13,
                //     ),
                //     // Expanded(
                //     //   child: const SizedBox(
                //     //     child: Text(
                //     //       'Max. 25,000/month can be loaded in Myntra wallet.',
                //     //       style: TextStyle(
                //     //         color: Colors.white,
                //     //         fontSize: 12.06,
                //     //         fontFamily: 'Urbanist',
                //     //         fontWeight: FontWeight.w400,
                //     //         letterSpacing: 0.24,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // )
                //   ],
                // ),
              }
            ],
          ),
        ));
  }
}
