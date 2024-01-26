import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionWidget extends StatefulWidget {
  const TermsConditionWidget();

  @override
  State<TermsConditionWidget> createState() => _TermsConditionWidgetState();
}

class _TermsConditionWidgetState extends State<TermsConditionWidget> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isExpended = !isExpended;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isExpended ? 210 : 55,
          padding: EdgeInsets.only(top: 15, left: 20, bottom: 0),
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
                    'Terms & Conditions',
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
                      child: const Text(
                        'Comes with 6 months validity.',
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
                          'You can use a maximum 10% of your accrued rewards when generating a voucher for this brand.',
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
                          'Max.25,000/month can be loaded in Myntra wallet.',
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
