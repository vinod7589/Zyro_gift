import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/height.dart';
import '../../../widgets/botton_animation_widget.dart';
import '../../../widgets/textfield_widget.dart';

class ResetPinWidget extends StatelessWidget {
  const ResetPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Reset your PIN',
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
          Text(
            'New Pin',
            style: TextStyle(
              color: Color(0xFFB6B6B6),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          8.verticalSpace,
          AppTextField(
            keyboardType: TextInputType.number,
            fillColor: Colors.transparent,
            borderColor: Color(0xFF7A7A7A),
          ),
          10.verticalSpace,
          Text(
            'Confirm New Pin',
            style: TextStyle(
              color: Color(0xFFB6B6B6),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          8.verticalSpace,
          AppTextField(
            keyboardType: TextInputType.number,
            fillColor: Colors.transparent,
            borderColor: Color(0xFF7A7A7A),
          ),
          30.verticalSpace,
          AnimationButton(
            width: Height.ButtonWidth,
            title: 'Submit',
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
