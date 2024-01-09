import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {
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
                Text(
                  'Light Mode',
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
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD0D0D0)),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  )
                ],
              ),
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
