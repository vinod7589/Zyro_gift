// ignore_for_file: library_private_types_in_public_api, camel_case_types, use_build_context_synchronously

import 'package:abc/src/constants/color.dart';
import 'package:abc/src/model/payment/check_payment_status_model.dart';
import 'package:abc/src/model/payment/purchasegift_voucher_model.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_failed.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'dart:async';

import '../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../infrastructure/repository/payment_repo.dart';
import '../../../../model/CartDataModel.dart';

class TimerCountPage extends StatefulWidget {
  final CartDataModel cartDataDetails;
  final String brandCode;
  final String merchantTransactionId;
  TimerCountPage(
      {required this.cartDataDetails,
      required this.brandCode,
      required this.merchantTransactionId});

  @override
  _timerCountPageState createState() => _timerCountPageState();
}

class _timerCountPageState extends State<TimerCountPage> {
  PaymentRepo paymentservice = PaymentRepo();
  late Timer _timer;
  late Timer _statusTimer;
  int _start = 5 * 60; // 5 minutes

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void stopTimer() {
    _timer.cancel();
    _statusTimer.cancel();
    setState(() {
      _start = 0;
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    if (_statusTimer.isActive) {
      _statusTimer.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    checkStatusPeriodically();
  }

  void checkStatusPeriodically() {
    _statusTimer =
        Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      if (_start > 1) {
        await onCheckStatus();
      } else {
        if (_timer.isActive) {
          _timer.cancel();
        }
        if (_statusTimer.isActive) {
          _statusTimer.cancel();
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PaymentFailedPage()));
      }
    });
  }

  onCheckStatus() async {
    CheckPaymentStatusModel checkStatus =
        await paymentservice.checkPaymentStatus(widget.merchantTransactionId);
    if (checkStatus.success == true) {
      PurchaseGiftVoucherModel purchaseVoucher =
          await paymentservice.purchaseGiftVoucherService(widget.cartDataDetails);
      if (purchaseVoucher.status == 'success') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PaymentSuccessPage()));
        _timer.cancel();
        _statusTimer.cancel();
      }
    } else {}
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        leading: SizedBox(),
      ),
      body: Column(
        children: [
          120.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.deepPurpleAccent,
                    size: 150.h,
                  ), // Circular loader
                  Positioned(
                    // Positioned text in the center
                    child: Text(
                      formatTime(_start),
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          50.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              textAlign: TextAlign.center,
              'Please go to your UPI app and approve the payment request Zyro',
              style: TextStyle(
                  color: grey, fontFamily: "Poppins", fontSize: 13.sp),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: Color(0xFF2D2D2D),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        12.verticalSpace,
                        Container(
                          width: 76,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Color(0xFF444444),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(91),
                            ),
                          ),
                        ),
                        30.verticalSpace,
                        Text(
                          'Are you sure you?',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        15.verticalSpace,
                        Text(
                          'This will stop the transaction process.',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        ),
                        15.verticalSpace,
                        InkWell(
                          onTap: () {
                            stopTimer();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            alignment: Alignment.center,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              'STOP TRANSACTION',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: const Text(
                'STOP TRANSACTION',
                style: TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
