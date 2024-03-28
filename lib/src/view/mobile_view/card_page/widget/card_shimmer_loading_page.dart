import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/page_padding.dart';

class CardShimmerLoadingPage extends StatelessWidget {
  const CardShimmerLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: SingleChildScrollView(
            child: SizedBox(
              // width: 200,
              // height: 220.0,
              child: Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.3),
                  direction: ShimmerDirection.ltr,
                  period: Duration(milliseconds: 1000),
                  enabled: true,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100)),
                              width: 200,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 6),
                            )
                          ]),
                      26.verticalSpace,
                      Container(

                          // width: 309.65,
                          height: 201,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16))),
                      10.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Spacer(),
                          Container(
                            width: 120,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  padding: const EdgeInsets.all(11.57),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3A363F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(96.41),
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                Container(
                                  width: 42,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  padding: const EdgeInsets.all(11.57),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3A363F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(96.41),
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                Container(
                                  width: 42,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  padding: const EdgeInsets.all(11.57),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3A363F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(96.41),
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                Container(
                                  width: 42,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  padding: const EdgeInsets.all(11.57),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3A363F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(96.41),
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                Container(
                                  width: 42,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      28.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          Spacer(),
                          Container(
                            width: 70,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Container(
                                width: 150,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF313131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: Color(0xFF313131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
