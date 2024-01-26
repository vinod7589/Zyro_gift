import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../controller/home_page_controller.dart';

class HowToRedeemWidget extends ConsumerStatefulWidget {
  const HowToRedeemWidget({required this.brandCode});
  final String brandCode;

  @override
  ConsumerState<HowToRedeemWidget> createState() => _HowToRedeemWidgetState();
}

class _HowToRedeemWidgetState extends ConsumerState<HowToRedeemWidget> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    var redeemcontroller = ref.watch(HomePageController(widget.brandCode));
    return GestureDetector(
        onTap: () {
          isExpended = !isExpended;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(top: 15, left: 20, bottom: 6),
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
                  Text(
                    'How To Redeem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.06,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.24,
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
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Divider(
                    color: Color(0xFF454545),
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/chekbox.png',
                      height: 18,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Text(
                        '${redeemcontroller.brandDetails?.tnc.toString() ?? 'cc'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.06,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                    )
                  ],
                ),
                9.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/chekbox.png',
                      height: 18,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: const SizedBox(
                        child: Text(
                          'Use it to pay during checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.06,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                9.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/chekbox.png',
                      height: 18,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: const SizedBox(
                        child: Text(
                          'Max. 25,000/month can be loaded in Myntra wallet.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.06,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              }
            ],
          ),
        ));
  }
}
