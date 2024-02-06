import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/services/shared_preferences.dart';
import 'login_page/onboarding_page.dart';
import 'landingpage.dart';

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
    var mobile = UserPreferences.userMobile;
    // if (mobile != "" && mobile != 'userMobile' && mobile.isNotEmpty) {
    if (mobile != "" && mobile != 'userMobile' && mobile.isNotEmpty) {
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
