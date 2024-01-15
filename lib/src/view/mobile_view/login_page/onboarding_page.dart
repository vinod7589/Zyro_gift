import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';
import '../../../util/services/shared_preferences.dart';
import '../widgets/landingpage.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => landingPage()));
                    },
                    child: Text(
                      'Zyro Gifts',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
                    'save up to 10% on',
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
              Container(
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
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
                                        backgroundColor:
                                            MaterialStatePropertyAll(
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
      ),
    );
  }
}
