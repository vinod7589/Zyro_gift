import 'package:abc/src/view/mobile_view/home_page/drawer/MyCard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meta_sdk/flutter_meta_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../customicon_icons.dart';
import 'home_page.dart';
import 'pofile_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  bool isfrombottom = false;

  @override
  void initState() {
    final metaSdk = FlutterMetaSdk();
    metaSdk.logEvent(name: "User Open the App");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          MyCardPage(isfrombottom: true),
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
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Customicon.home,
              size: 23,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 23,
            ),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Customicon.profile,
              size: 23,
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
