import 'package:abc/src/view/mobile_view/card_page/kyc_page/kyc_option_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPrivacyPolicyPage extends StatefulWidget {
  const CardPrivacyPolicyPage({super.key});

  @override
  State<CardPrivacyPolicyPage> createState() => _CardPrivacyPolicyPageState();
}

class _CardPrivacyPolicyPageState extends State<CardPrivacyPolicyPage> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    alignment: AlignmentDirectional.topEnd,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ],
            ),
            Text(
              'Privacy & Policy',
              style: TextStyle(
                color: Color(0xFFEDEDED),
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                5.horizontalSpace,
                Container(
                  height: 28,
                  // width: 50,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fillColor: MaterialStatePropertyAll(Colors.white),
                    checkColor: Colors.black,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ),
                Container(
                  width: 248.w,
                  child: Text(
                    'By proceeding further, I agree to ZyroPay sharing my personal information (Name (First Name, Last Name); Mobile Number; Email ID) with Pine Labs in connection with opening a Pine Labs PPI. I, further agree that Pine Labs or its contractors may hold and process my Persona Information for a period of 10 years as prescribed by RBI guidelines and I have no objection thereto. I have read and understood the terms and conditions and privacy policy for the Prepaid Card – PPI issued by PineLabs Private Limited (Pine Labs). I agree to abide by these terms and conditions and privacy policy, as updated from time to time.',
                    style: TextStyle(
                      color: Color(0xFFA3A3A3),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                5.horizontalSpace,
              ],
            ),
            30.verticalSpace,
            InkWell(
              onTap: () {
                if (_isChecked) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => KycOptionPage()));
                } else {}
              },
              child: Container(
                alignment: Alignment.center,
                width: 181,
                height: 42.93,
                decoration: ShapeDecoration(
                  color:
                      _isChecked == false ? Colors.grey.shade600 : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
