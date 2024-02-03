import 'package:abc/src/view/mobile_view/login_page/customer_enter_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';
import 'animationWidget/HomeScreen.dart';
import 'mobile_number_page.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          elevation: 0,
          brightness: Brightness.light,
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,
          ]),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/zyropay.png',
                    width: 99,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Get exciting discounts, \n',
                            style: TextStyle(
                              color: Color(0xFF373737),
                              fontSize: 24.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.48,
                            ),
                          ),
                          TextSpan(
                            text: 'Always',
                            style: TextStyle(
                              color: Color(0xFF373737),
                              fontSize: 24.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'save up to 50% on',
                        style: TextStyle(
                          color: Color(0xFF5801B7),
                          fontSize: 14.61.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.29,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Container(
              padding: EdgeInsets.only(top: 15),
              color: Color(0xFFF8F8F8),
              // width: 300,
              height: 365.h,
              child: HomeScreen(),
            ),
            Container(
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 51,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MobileNumberPage()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
