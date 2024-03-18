import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/mobile_view/home_page/drawer/account_details_page.dart';
import 'package:abc/src/view/mobile_view/home_page/drawer/help_support_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Packages/page_transition/enum.dart';
import '../../../../Packages/page_transition/page_transition.dart';
import '../../../../infrastructure/repository/auth_repo.dart';
import 'MyCard_page.dart';
import 'transactions_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthRepo auth = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, bottom: 5, right: 20, left: 35),
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
                          padding:
                              const EdgeInsets.only(top: 10, left: 5, right: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              child: Image.asset(
                                'assets/images/profileimage.png',
                                height: 25.h,
                              )),
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
                          fontSize: 22.10.sp,
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
                          fontSize: 14.sp,
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
                          PageTransition(
                              child: AccountDetailsPage(),
                              type: PageTransitionType.theme));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Image.asset(
                                    'assets/images/Profile.png',
                                    height: 25.h,
                                  ),
                                ),
                                25.horizontalSpace,
                                Text(
                                  'Account Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
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
                          PageTransition(
                              child: MyCardPage(
                                isfrombottom: false,
                              ),
                              type: PageTransitionType.theme));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Image.asset(
                                    'assets/images/mycard.png',
                                    height: 22.h,
                                  ),
                                ),
                                25.horizontalSpace,
                                Text(
                                  'My Cards',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
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
                          PageTransition(
                              child: TransactionsPage(),
                              type: PageTransitionType.theme));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Image.asset(
                                    'assets/images/clock.png',
                                    height: 25.h,
                                  ),
                                ),
                                25.horizontalSpace,
                                Text(
                                  'Transactions',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
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
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => AppSettingPage()));
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 18, bottom: 15),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         // Container(
                  //         //   child: Row(
                  //         //     children: [
                  //         //       Image.asset(
                  //         //         'assets/images/settings.png',
                  //         //         height: 25,
                  //         //       ),
                  //         //       SizedBox(
                  //         //         width: 34,
                  //         //       ),
                  //         //       Text(
                  //         //         'Settings',
                  //         //         style: TextStyle(
                  //         //           color: Colors.white,
                  //         //           fontSize: 15.sp,
                  //         //           fontFamily: 'Poppins',
                  //         //           fontWeight: FontWeight.w500,
                  //         //           letterSpacing: 0.44,
                  //         //         ),
                  //         //       )
                  //         //     ],
                  //         //   ),
                  //         // ),
                  //         Image.asset(
                  //           'assets/images/rightarrow.png',
                  //           height: 19,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Divider(
                  //   color: Color(0xFF3B3B3B),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 28),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: HelpSupportPage(),
                                type: PageTransitionType.theme));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: Image.asset(
                                  'assets/images/help.png',
                                  height: 25.h,
                                ),
                              ),
                              25.horizontalSpace,
                              Text(
                                'Help & Support',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.44,
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                            'assets/images/rightarrow.png',
                            height: 19,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 12.verticalSpace
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout Confirmation'),
                          content: Text('Are you sure you want to log out?'),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.grey.withOpacity(0.2))),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Perform logout operation
                                    auth.signOut(context); // Close the dialog
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                    // AuthRepo.signOut(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Logout.png',
                          color: Colors.white60,
                          height: 27.h,
                        ),
                        20.horizontalSpace,
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 18.20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.38,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
