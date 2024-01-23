import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/account_details_page.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/app_setting_page.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/transactions_page.dart';
import 'package:abc/src/view/mobile_view/widgets/landingpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_page/home_items_page/pofile/MyCard_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 20, left: 35),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF2D2D2D),
                          ),
                          height: 80,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                child: Image.asset(
                                    'assets/images/profileimage.png')),
                          ),
                        ),
                        Spacer(),
                        // IconButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => LandingPage()));
                        //     },
                        //     icon: Icon(
                        //       Icons.arrow_forward_ios_rounded,
                        //       color: Colors.white,
                        //     ))
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text(
                          UserPreferences.fullName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.11,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Text(
                          UserPreferences.userMobile,
                          style: TextStyle(
                            color: Color(0xFF979797),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.11,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: ShapeDecoration(
                  color: Color(0xFF2D2D2D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountDetailsPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Profile.png',
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    'Account Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.44,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/rightarrow.png',
                              height: 19,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF3B3B3B),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyCardPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/card1.png',
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    'My Cards',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.44,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/rightarrow.png',
                              height: 19,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF3B3B3B),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionsPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/clock.png',
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    'Transactions',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.44,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/rightarrow.png',
                              height: 19,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF3B3B3B),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppSettingPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/settings.png',
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.44,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/rightarrow.png',
                              height: 19,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF3B3B3B),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/help.png',
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 34,
                                ),
                                Text(
                                  'Help & Support',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.44,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/rightarrow.png',
                            height: 19,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
