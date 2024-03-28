import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/view/mobile_view/card_page/manage_transactions_limit_page.dart';
import 'package:abc/src/view/mobile_view/card_page/widget/block_card_widget.dart';
import 'package:abc/src/view/mobile_view/card_page/widget/freeze_card_widget.dart';
import 'package:abc/src/view/mobile_view/card_page/widget/reset_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreOptionWidget extends StatelessWidget {
  const MoreOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          23.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 76,
                height: 5,
                decoration: ShapeDecoration(
                  color: Color(0xFF444444),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(91),
                  ),
                ),
              ),
            ],
          ),
          27.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'More options',
              style: TextStyle(
                color: Color(0xFFE1E1E1),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.08,
              ),
            ),
          ),
          30.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                elevation: 0,
                context: context,
                isScrollControlled: true,
                backgroundColor: const Color(0xFF2C2C2C),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
                builder: (context) => Consumer(builder: (context, ref, child) {
                  return StatefulBuilder(builder: (context, f) {
                    return FreezeCardWidget();
                  });
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 51,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3E3E3E),
                        shape: OvalBorder(),
                      ),
                      child: Image.asset(
                        'assets/images/bill-payments/freeze.png',
                        height: 21,
                      )),
                  15.horizontalSpace,
                  Text(
                    'Freeze Card',
                    style: TextStyle(
                      color: Color(0xFFE1E1E1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          10.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                elevation: 0,
                context: context,
                isScrollControlled: true,
                backgroundColor: const Color(0xFF2C2C2C),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
                builder: (context) => Consumer(builder: (context, ref, child) {
                  return StatefulBuilder(builder: (context, f) {
                    return ResetPinWidget();
                  });
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 51,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3E3E3E),
                        shape: OvalBorder(),
                      ),
                      child: Image.asset(
                        'assets/images/bill-payments/reset-password.png',
                        height: 8,
                      )),
                  15.horizontalSpace,
                  Text(
                    'Reset Pin',
                    style: TextStyle(
                      color: Color(0xFFE1E1E1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          10.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageTransition(
                      child: ManageTransactionsPage(),
                      type: PageTransitionType.rightToLeft));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 51,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3E3E3E),
                        shape: OvalBorder(),
                      ),
                      child: Image.asset(
                        'assets/images/bill-payments/manage-transactions.png',
                        height: 20,
                      )),
                  15.horizontalSpace,
                  Text(
                    'Manage transactions & Limits',
                    style: TextStyle(
                      color: Color(0xFFE1E1E1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: ShapeDecoration(
              color: Color(0xFF333333),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 51,
                    height: 51,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3E3E3E),
                      shape: OvalBorder(),
                    ),
                    child: Image.asset(
                      'assets/images/bill-payments/credit-card1.png',
                      height: 20,
                    )),
                15.horizontalSpace,
                Text(
                  'Order  Physical  Card',
                  style: TextStyle(
                    color: Color(0xFFE1E1E1),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
          10.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                elevation: 0,
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
                builder: (context) => Consumer(builder: (context, ref, child) {
                  return StatefulBuilder(builder: (context, f) {
                    return BlockCardWidget();
                  });
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 51,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3E3E3E),
                        shape: OvalBorder(),
                      ),
                      child: Image.asset(
                        'assets/images/bill-payments/block-card.png',
                        height: 24,
                      )),
                  15.horizontalSpace,
                  Text(
                    'Block Card',
                    style: TextStyle(
                      color: Color(0xFFF60909),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
