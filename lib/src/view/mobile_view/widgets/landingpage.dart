import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../customicon_icons.dart';
import '../bottomNavigationBar_tabs/mycard_tab.dart';
import '../bottomNavigationBar_tabs/pofile_page.dart';
import '../home_page/home_page.dart';

class landingPage extends StatefulWidget {
  landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPage();
}

class _landingPage extends State<landingPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MyCardTab(),
    ProfilePage(),
  ];

  // _selectedIndex = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
            fontFamily: 'Poppins'),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Customicon.home,
              size: 24.h,
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
              size: 24.h,
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        // onTap: _onItemTapped,
      ),
    );
  }
}
