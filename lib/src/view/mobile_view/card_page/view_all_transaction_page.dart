import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../constants/color.dart';
import '../../../constants/height.dart';
import '../../widgets/textfield_widget.dart';

class ViewAllTransactionPage extends StatelessWidget {
  const ViewAllTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: SizedBox(
                      height: Height.SearchBarHeight,
                      child: AppTextField(
                        textColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        borderColor: textFieldBorderColor,
                        hintstyle: TextStyle(
                          color: const Color(0xFFB5B5B5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Colors.transparent,
                        hintText: 'Search Transaction',
                        prefixIcon: SizedBox(
                          height: 17.h,
                          width: 17.w,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/bill-payments/search.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  30.horizontalSpace,
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 111,
                      height: 28,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1F1F1F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Text(
                        'March 2024',
                        style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.13,
                        ),
                      ),
                    ),
                    Container(
                        width: 187,
                        decoration: BoxDecoration(
                            border: GradientBoxBorder(
                                width: 0.7,
                                gradient: LinearGradient(colors: [
                                  Color(0xFF333333),
                                  Color(0xFF333333).withOpacity(0.1),
                                ]))))
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                physics: PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFF313131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Color(0xFF5F5F5F),
                              shape: OvalBorder(),
                            ),
                            child: Text(
                              'V',
                              style: TextStyle(
                                color: Color(0xFFDFDFDF),
                                fontSize: 19.60.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.20,
                              ),
                            ),
                          )),
                      13.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            child: Text(
                              'Send to Vladimir Putin',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xFFDFDFDF),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.13,
                              ),
                            ),
                          ),
                          3.verticalSpace,
                          Container(
                            width: 180,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              'March 3, 2024 at 8:30 PM',
                              style: TextStyle(
                                color: Color(0xFF565358),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.12,
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        '₹ ' '434.10',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
