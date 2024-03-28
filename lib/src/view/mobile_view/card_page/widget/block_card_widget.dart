import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlockCardWidget extends StatelessWidget {
  const BlockCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
        Stack(alignment: Alignment.center, children: [
          Container(
            height: 370,
          ),
          Positioned(
            top: 40,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              width: MediaQuery.of(context).size.width,
              height: 330,
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              alignment: Alignment.center,
              width: 138,
              height: 138,
              decoration: ShapeDecoration(
                color: Color(0xFF343434),
                shape: OvalBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/bill-payments/block-card1.png',
                  height: 81,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Block Card Permanent?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFF4F4F4),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      14.verticalSpace,
                      Text(
                        'Are you sure to block your card permanently,\nYou Won’t be able to use either \nyour virtual or physical card anymore.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFB6B6B6),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      35.verticalSpace,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 121,
                              height: 47,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(66),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          18.horizontalSpace,
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 121,
                              height: 47,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFF54624)),
                                  borderRadius: BorderRadius.circular(66),
                                ),
                              ),
                              child: Text(
                                'Block',
                                style: TextStyle(
                                  color: Color(0xFFF54624),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ],
    );
  }
}
