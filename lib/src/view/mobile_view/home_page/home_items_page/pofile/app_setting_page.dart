import 'package:abc/src/infrastructure/repository/auth_repo.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_failed.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_success.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_timer_count.dart';
import 'package:abc/src/view/mobile_view/login_page/mobile_number_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {
  AuthRepo auth = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
          titleSpacing: 5,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          title: Text(
            'App Setting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1.11,
              letterSpacing: 0.08,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Color(0xFFF0F0F0),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.29,
                  ),
                ),
                Container(
                  width: 16.40,
                  height: 16.40,
                  decoration: ShapeDecoration(
                    color: Color(0xFF5801B7),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD0D0D0)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Color(0xFF3B3B3B),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentSuccessPage()));
                  },
                  child: Text(
                    'Light Mode',
                    style: TextStyle(
                      color: Color(0xFFF0F0F0),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                ),
                Container(
                  width: 16.40,
                  height: 16.40,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD0D0D0)),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
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
                          height: 27,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.20,
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
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
