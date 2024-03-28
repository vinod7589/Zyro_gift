import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/height.dart';
import '../../../widgets/botton_animation_widget.dart';

class FreezeCardWidget extends StatelessWidget {
  const FreezeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          17.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                  25.verticalSpace,
                  Text(
                    'Freeze Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEDEDED),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          28.verticalSpace,
          SvgPicture.asset(
            'assets/images/bill-payments/freez-card.svg',
            height: 70,
          ),
          30.verticalSpace,
          Text(
            'Your card will be temporarily restricted from all transactions. You have the option to unfreeze it instantly by tapping.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFB6B6B6),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          30.verticalSpace,
          AnimationButton(
            width: Height.ButtonWidth,
            title: 'Freeze Card',
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          20.verticalSpace,
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFFBEBEBE),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
