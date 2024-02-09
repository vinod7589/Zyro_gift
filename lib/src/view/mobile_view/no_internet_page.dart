import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/internet_check_status_controller.dart';

Consumer NoInternetPage(Function onRetryPressed, context,
    {bool showBackButton = true}) {
  return Consumer(builder: (context, ref, child) {
    ref.read(CheckInternetController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        leading: showBackButton
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : SizedBox(),
      ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nointernet.png',
                  height: 220.h,
                ),
              ],
            ),
            50.verticalSpace,
            Text(
              'No Internet Connection',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
            8.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              'Please Check your Connection and Try Again',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
            52.verticalSpace,
            Container(
              height: 51.h,
              width: 162.w,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  bool isConnted =
                      ref.read(CheckInternetController).isConnected;

                  if (isConnted) {
                    onRetryPressed();
                  }
                },
                child: Text(
                  'Retry',
                  style: TextStyle(
                      color: Color(0xFE2D2D2D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  });
}

///////////////////////////WithOut Back Button////////////////////
Widget NoInternetPageWithoutBackButton(
  Function onRetryPressed,
) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    ),
    backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 50.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/nointernet.png',
                height: 220.h,
              ),
            ],
          ),
          50.verticalSpace,
          Text(
            'No Internet Connection',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          8.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            'Please Check your Connection and Try Again',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
          ),
          52.verticalSpace,
          Container(
            height: 51.h,
            width: 162.w,
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () => onRetryPressed(),
              child: Text(
                'Retry',
                style: TextStyle(
                    color: Color(0xFE2D2D2D),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
