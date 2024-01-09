import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/auth/registration_model.dart';
import 'package:abc/src/model/auth/generate_otp_model.dart';
import 'package:abc/src/model/auth/verify_otp_model.dart';
import 'package:abc/src/view/mobile_view/widgets/landingpage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/services/shared_preferences.dart';
import '../../view/Utility/constants.dart';
import '../../view/mobile_view/login_page/customer_enter_details.dart';
import '../../view/mobile_view/login_page/otp_verification_page.dart';
import '../../view/widgets/dialogs/loading_dialog.dart';

class AuthRepo {
  // String base64String = '${UserPreferences.otpTempId}';
  Future<Generateotp?> generateOTP(String mobile, context) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/UserManagement/GenerateOtp?mobile_number=$mobile',
      );

      print(response.data);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Send Otp successfully"),
          dismissDirection: DismissDirection.up,
          backgroundColor: constants.success_notification_color_code,
        ));
        print(response.data["ref_id"]);
        print(response.data["success"]);
        print(response.data["message"]);
        if (response.data["success"] == true) {
          UserPreferences.setTempOtpId(id: response.data["ref_id"]);
          UserPreferences.setMobileNoForOtp(mobile: mobile);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OtpVerificationPage()));
        }
        print(UserPreferences.otpTempId);
        print(UserPreferences.mobileNoForOtp);
      } else {
// Handle error scenarios
        print('Failed to generate OTP. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
// Handle network errors or exceptions
      print('Error: $error');
      Navigator.pop(context);

      return null;
    }
  }

  Future<VerifyOtp?> verifyOTP(
      {required String otp, required String smstoken, context}) async {
    try {
      // List<int> decodedBytes = base64.decode(base64String);
      // String decodedString = utf8.decode(decodedBytes);
      print(
          '$baseUrl/api/UserManagement/VerifyOtp?Ref_Id=${smstoken.toString()}&OTP=$otp&mobile_number=${UserPreferences.mobileNoForOtp}');
      final response = await dio.post(
        '$baseUrl/api/UserManagement/VerifyOtp?Ref_Id=$smstoken&OTP=$otp&mobile_number=${UserPreferences.mobileNoForOtp}',
      );
      final res = VerifyOtp();
      print(res);
      print(response.data);
      if (response.statusCode == 200) {
        if (response.data["success"] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Verify successfully"),
            dismissDirection: DismissDirection.up,
            backgroundColor: constants.success_notification_color_code,
          ));

          UserPreferences.setTokenId(token: response.data['token']);

          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => customer_enter_details()));
          UserPreferences.removeMobileNoForOtp();
          UserPreferences.removeMobileNoForOtp();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${response.data["message"]}'),
            dismissDirection: DismissDirection.up,
            backgroundColor: constants.failed_notification_color_code,
          ));
          Timer(const Duration(seconds: 2), () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
          Navigator.pop(context);
        }
        print(response.data["success"]);
        print(response.data["message"]);
        print(response.data["token"]);
        print(UserPreferences.tokenId);
      } else {
// Handle error scenarios
        print('Failed to verify OTP. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
// Handle network errors or exceptions
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Error: $error',
        ),
        dismissDirection: DismissDirection.up,
        backgroundColor: constants.failed_notification_color_code,
      ));
      Timer(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
      return null;
    }
  }

  Future<Signup?> signUp(String fullName, String email, String dob,
      String referalCode, context) async {
    try {
      final response = await dio.post('$baseUrl/api/UserManagement/SignUp',
          data: {
            "name": fullName,
            "email": email,
            "dob": dob,
            "referralCode": referalCode,
          },
          options: Options(validateStatus: (status) => true, headers: {
            'accept': '*/*',
            'Content-Type': 'application/json; charset=utf-8',
            "Authorization": "Bearer ${UserPreferences.tokenId}"
          }));

      print(response.data);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("SignUp successfully"),
            dismissDirection: DismissDirection.up,
            backgroundColor: constants.success_notification_color_code,
          ),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => landingPage()));
        if (response.data['success'] == true) {
          UserPreferences.setFullName(fullName: fullName);
          UserPreferences.setEmail(email: email);
          UserPreferences.setDob(dob: dob);
          UserPreferences.setReferalCole(referaCode: referalCode);
          print(UserPreferences.fullName);
          print(UserPreferences.email);
          print(UserPreferences.dob);
          print(UserPreferences.referalCode);
        } else {
          print("Signup failed: ${response.statusCode}");
        }
      } else {
// Handle error scenarios
        print('Failed to generate OTP. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
// Handle network errors or exceptions
      print('Error: $error');
      return null;
    }
  }
}
