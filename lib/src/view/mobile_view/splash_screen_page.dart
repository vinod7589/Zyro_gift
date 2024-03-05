import 'dart:developer';

import 'package:abc/src/view/mobile_view/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Packages/Animated_Text_Kit/animated_text_kit.dart';
import '../../controller/internet_check_status_controller.dart';
import '../../util/services/shared_preferences.dart';
import 'bottomNavigationBar_tabs/bottomNavigationBar.dart';
import 'login_page/onboarding_page.dart';

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
        await Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 1500), () {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  pause: Duration(seconds: 2),
                  animatedTexts: [
                    WavyAnimatedText('ZYRO',
                        textStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFE6C02AF))),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                // TextLiquidFill(
                //   text: 'ZYRO',
                //   waveColor: Colors.deepPurple,
                //   waveDuration: Duration(milliseconds: 1000),
                //   boxBackgroundColor: Colors.black,
                //   textStyle: TextStyle(
                //     color: Colors.black,
                //     fontSize: 40.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   boxHeight: 200.0,
                //   boxWidth: 200,
                // ),
                10.horizontalSpace,
                Image.asset(
                  'assets/images/pay.png',
                  width: 60.h,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
