// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../global_providers.dart';
// import '../../../constants/snackbar.dart';
// import '../../../global_providers.dart';
// import '../../../infrastructure/http/app_exception.dart';
// import '../../../util/services/shared_preferences.dart';
// import '../state/otp_state.dart';
//
// class OtpController extends StateNotifier<OTPState> {
//   OtpController(this.read) : super(const OTPState()) {
//     _initTimer();
//   }
//
//   final Reader read;
//
//   late Timer _timer;
//
//   void _initTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (state.timeUp! > 0) {
//         state = state.copyWith(timeUp: state.timeUp! - 1);
//       } else {
//         timer.cancel();
//       }
//     });
//   }
//
//   void setOtp(String otp) {
//     state = state.copyWith(otp: otp);
//   }
//
//   Future<void> resend(
//       {required String mobileNo, required BuildContext context}) async {
//     List<String> authRes;
//     try {
//       // UserPreferences.removeTempOtpId();
//       authRes =
//           await read(authController.notifier).generateOtp(mobileNo: mobileNo);
//       UserPreferences.setTempOtpId(id: authRes[2]);
//       state = state.copyWith(timeUp: 60, otp: '');
//     } on AppException catch (e) {
//       e.whenOrNull(
//         connectivity: () {
//           ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
//             content: "Please check your internet connection",
//           ));
//         },
//         errorWithMessage: (message) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(getSnackBar(content: message));
//         },
//         error: () {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(getSnackBar(content: "Something went wrong"));
//         },
//       );
//     }
//     _initTimer();
//   }
//
//   // @override
//   // void dispose() {
//   //   _timer.cancel();
//   //   SmsAutoFill().unregisterListener();
//   //   super.dispose();
//   // }
//
//   Future<List<String>> continueOtp(
//       {required BuildContext context, required String smsToken}) async {
//     List<String> authRes = [];
//
//     if (state.otp.length == 6) {
//       authRes = await read(authController.notifier)
//           .verifyOTP(otp: state.otp, smstoken: smsToken);
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(getSnackBar(content: "Please Enter a Valid OTP."));
//     }
//     return authRes;
//   }
// }
