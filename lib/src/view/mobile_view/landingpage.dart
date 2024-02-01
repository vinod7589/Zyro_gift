import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/MyCard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../customicon_icons.dart';
import 'bottomNavigationBar_tabs/pofile_page.dart';
import 'home_page/home_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  bool isfrombottom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          MyCardPage(
            isfrombottom: true,
            // Isfrombottom: true,
          ),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Customicon.home,
              size: 26.h,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 26.h,
            ),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Customicon.profile,
              size: 26.h,
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
