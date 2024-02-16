import 'dart:developer';

import 'package:abc/src/view/mobile_view/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/internet_check_status_controller.dart';
import '../../util/services/shared_preferences.dart';
import 'login_page/onboarding_page.dart';
import 'bottomNavigationBar.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoard();
    // Delay for 3 seconds and then navigate to the main screen
  }

  Future<void> navigateToOnBoard() async {
    var userId = UserPreferences.userId;
    var name = UserPreferences.fullName;
    await ref.read(CheckInternetController).checkConnectivity();
    bool isInternetConnected = ref.read(CheckInternetController).isConnected;
    print(name);
    if (isInternetConnected) {
      if (userId != "" &&
          userId != 'userMobile' &&
          userId.isNotEmpty &&
          name.isNotEmpty &&
          name != '' &&
          name != 'full_Name') {
        await Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        });
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingPage()),
          );
        });
      }
    } else {
      log("asdfhafhshdsfjdfhsa");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => NoInternetPage(() {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  }, context, showBackButton: false)));
    }

    // await Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => OnboardingPage()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Center(
          child: Image.asset(
            'assets/images/zyropay.png',
            width: 190.h,
          ),
        ),
      )),
    );
  }
}
