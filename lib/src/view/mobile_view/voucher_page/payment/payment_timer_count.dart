// ignore_for_file: library_private_types_in_public_api, camel_case_types, use_build_context_synchronously

import 'dart:async';

import 'package:abc/src/model/payment/check_payment_status_model.dart';
import 'package:abc/src/model/payment/purchasegift_voucher_model.dart';
import 'package:abc/src/view/mobile_view/voucher_page/payment/payment_failed.dart';
import 'package:abc/src/view/mobile_view/voucher_page/payment/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  late Timer _statusTimer;
  late DateTime _startTime;
  late bool _statusChecked;
  late int _remainingTime;
  String rrn = "";

  @override
  void initState() {
    super.initState();
    _statusChecked = false;
    _startTime = DateTime.now();
    _remainingTime = 300; // 5 minutes in seconds
    startStatusTimer();
  }

  @override
  void dispose() {
    _statusTimer.cancel();
    super.dispose();
  }

  void startStatusTimer() {
    const int interval = 1; // 5 second interval
    _statusTimer = Timer.periodic(Duration(seconds: interval), (timer) async {
      setState(() {
        // Calculate remaining time
        // _remainingTime = 300 - DateTime.now().difference(_startTime).inSeconds;
        _remainingTime--;
      });
      // Check if 5 minutes have elapsed
      if (_remainingTime <= 0) {
        // Cancel timer and navigate to failure page
        _statusTimer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaymentFailedPage()),
        );
      } else {
        if (_remainingTime % 5 == 0) {
          if (!_statusChecked) {
            // await Future.delayed(Duration(seconds: 1));
            checkStatus(); // Your method to check status
          }
        }
      }
    });
  }

  void checkStatus() async {
    // Simulated status check
    bool success = await getStatusFromAPI(); //Replace with your actual API call

    if (success) {
      setState(() {
        _statusChecked = true;
      });
      // Navigate to success page
      // createVoucher();
      _statusTimer.cancel();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PaymentSuccessPage()));
    }
  }

  void stopTimer() {
    // Cancel the status timer and navigate to failure page
    _statusTimer.cancel();
  }

  getStatusFromAPI() async {
    CheckPaymentStatusModel checkStatus =
        await paymentservice.checkPaymentStatus(widget.merchantTransactionId);
    if (checkStatus.success == true) {
      setState(() {
        rrn = checkStatus.bankReference!;
      });
    }
    return checkStatus.success;
  }

  createVoucher() async {
    await Future.delayed(Duration(seconds: 2));
    var req = {
      "userId": widget.cartDataDetails.userId,
      "brandcode": widget.cartDataDetails.brandcode,
      "discount": widget.cartDataDetails.discount,
      "rrn": rrn,
      "vouchers": widget.cartDataDetails.vouchers
    };
    PurchaseGiftVoucherModel purchaseVoucher =
        await paymentservice.purchaseGiftVoucherService(req);
    if (purchaseVoucher.status == 'success') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PaymentSuccessPage()));
    }
  }

  // late Timer _timer;
  // late Timer _statusTimer;
  // int _start = 5 * 60; // 5 minutes
  //
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }
  //
  // void stopTimer() {
  //   _timer.cancel();
  //   _statusTimer.cancel();
  //   setState(() {
  //     _start = 0;
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   if (_timer.isActive) {
  //     _timer.cancel();
  //   }
  //   // if (_statusTimer.isActive) {
  //   //   _statusTimer.cancel();
  //   // }
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  //   checkStatusPeriodically();
  // }
  //
  // void checkStatusPeriodically() {
  //   _statusTimer =
  //       Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
  //     if (_start > 1) {
  //       if (rrn == '') {
  //         await onCheckStatus();
  //       }
  //     } else {
  //       if (_timer.isActive) {
  //         _timer.cancel();
  //       }
  //       if (_statusTimer.isActive) {
  //         _statusTimer.cancel();
  //       }
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const PaymentFailedPage()));
  //     }
  //   });
  // }
  //
  // String rrn = '';
  // bool isGiftCreated = false;
  //
  // onCheckStatus() async {
  //   CheckPaymentStatusModel checkStatus =
  //       await paymentservice.checkPaymentStatus(widget.merchantTransactionId);
  //   if (checkStatus.success == true) {
  //     setState(() {
  //       rrn = checkStatus.bankReference!;
  //       _timer.cancel();
  //       _statusTimer.cancel();
  //     });
  //     if (isGiftCreated == false) {
  //       var req = {
  //         "userId": widget.cartDataDetails.userId,
  //         "brandcode": widget.cartDataDetails.brandcode,
  //         "discount": widget.cartDataDetails.discount,
  //         "rrn": rrn,
  //         "vouchers": widget.cartDataDetails.vouchers
  //       };
  //       PurchaseGiftVoucherModel purchaseVoucher =
  //           await paymentservice.purchaseGiftVoucherService(req);
  //       setState(() {
  //         isGiftCreated = true;
  //       });
  //       if (purchaseVoucher.status == 'success') {
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => PaymentSuccessPage()));
  //       }
  //     }
  //   } else {}
  // }

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
                      formatTime(_remainingTime),
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
                  color: Colors.grey, fontFamily: "Poppins", fontSize: 13.sp),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                stopTimer();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 120.w,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                alignment: Alignment.center,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            20.horizontalSpace,
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 120.w,
                                alignment: Alignment.center,
                                height: 50.h,
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
                          ],
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     height: 50.h,
                        //     width: 180,
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //     child: const Text(
                        //       'Cancel',
                        //       style: TextStyle(
                        //           color: Color(0xFF2C2C2C),
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //   ),
                        // ),
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
