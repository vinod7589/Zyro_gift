import 'package:abc/src/model/homePage/add_money_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page/home_items_page/pofile_page.dart';
import '../home_page/home_page.dart';
import '../home_page/wallet_page.dart';

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
    WalletPage(),
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
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts_outlined,
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
