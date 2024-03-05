import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/mobile_view/splash_screen_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  await UserPreferences.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    bool isDebugMode = false;
    assert(isDebugMode = true);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: isDebugMode,
              title: 'ZYRO Pay',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: const Color(0xFF161616),
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    centerTitle: false,
                    titleSpacing: 5,
                    titleTextStyle: TextStyle(fontSize: 18.sp)),
                scaffoldBackgroundColor: const Color(0xFF161616),
                fontFamily: 'Poppins',
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen());
        });
  }
}
