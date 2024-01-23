import 'dart:async';
import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/auth/registration_model.dart';
import 'package:abc/src/model/auth/generate_otp_model.dart';
import 'package:abc/src/model/auth/verify_otp_model.dart';
import 'package:abc/src/view/mobile_view/login_page/mobile_number_page.dart';
import 'package:abc/src/view/mobile_view/login_page/onboarding_page.dart';
import 'package:abc/src/view/mobile_view/widgets/landingpage.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/material.dart';

import '../../model/auth/get_user_detail_model.dart';
import '../../util/services/shared_preferences.dart';
import '../../view/mobile_view/login_page/customer_enter_details.dart';
import '../../view/mobile_view/login_page/otp_verification_page.dart';

class AuthRepo {
  Future<Generateotp?> generateOTP(String mobile, context) async {
    try {
      var request = {
        "mobile_number": mobile,
      };
      final response = await DioApiService.post(
          '/api/UserManagement/GenerateOtp?mobile_number=$mobile', request);
      // print(response);
      Generateotp res = Generateotp.fromJson(response);
      if (res.success == true) {
        Navigator.pop(context);
        UserPreferences.setTempOtpId(id: res.refId.toString());
        UserPreferences.setUserMobile(mobileNumber: mobile);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OtpVerificationPage()));
        print(UserPreferences.otpTempId + " refID");
        print(UserPreferences.userMobile + ' UserMobileNumber');
      } else {
        showToast(message: 'error');
      }
      return res;
    } catch (error) {
      return Generateotp(success: false, message: 'Internal server error');
    }
  }

  static Future<VerifyOtpModel?> verifyOTP(
      {required String otp, required String refId, context}) async {
    try {
      var request = {
        'OTP': otp,
        'Ref_Id': refId,
      };
      final response = await DioApiService.post(
          '/api/UserManagement/VerifyOtp?Ref_Id=$refId&OTP=$otp&mobile_number=${UserPreferences.userMobile}',
          request);
      print("sdasfdsdf$response");
      VerifyOtpModel res = VerifyOtpModel.fromJson(response);
      print(res);
      if (res.success == true) {
        // showToast(message: 'Verify successfully');
        UserPreferences.setTokenId(token: res.token.toString());
        Navigator.pop(context);
        if (res.isRegistered == true) {
          await getUserDetail();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CustomerEnterDetails()));
        }
      } else {
        showToast(message: 'Invalid Otp');
        Navigator.pop(context);
      }
      print(response);
      return res;
    } catch (error) {
// Handle network errors or exceptions
      print('Error: $error');
      return VerifyOtpModel(success: false, message: 'Internal server error');
    }
  }

  Future<Generateotp?> resendOtp(context) async {
    try {
      final response = await DioApiService.post(
          '/api/UserManagement/GenerateOtp?mobile_number=${UserPreferences.userMobile}',
          {});
      Generateotp res = Generateotp.fromJson(response);
      if (res.success == true) {
        UserPreferences.removeRefId();
        UserPreferences.setTempOtpId(id: res.refId.toString());
      } else {
        showToast(message: 'error');
      }
      return res;
    } catch (error) {
      return Generateotp(success: false, message: 'Internal server error');
    }
  }

  static Future<Signup?> signUp(String fullName, String email, String dob,
      String referalCode, context) async {
    try {
      var request = {
        "name": fullName,
        "email": email,
        "dob": dob,
        "referralCode": referalCode,
      };
      final response =
          await DioApiService.AuthPost('/api/UserManagement/SignUp', request);
      Signup res = Signup.fromJson(response);
      print(request);
      if (res.status == 'success') {
      } else {}
      return res;
    } catch (error) {
      print('Error: $error');
      return Signup(status: 'failed', description: 'Internal server error');
    }
  }

  static Future<void> getUserDetail() async {
    try {
      final response = await DioApiService.AuthPost(
          '/api/UserManagement/GetUserDetails', {});
      GetUserDetailModel res = GetUserDetailModel.fromJson(response);

      if (res.status == 'success') {
        UserPreferences.setFullName(fullName: res.data?.name ?? "");
        UserPreferences.setEmail(email: res.data?.email ?? "");
        UserPreferences.setUserMobile(
            mobileNumber: res.data?.mobileNumber ?? "");
        UserPreferences.setDob(dob: res.data?.dob ?? "");
        UserPreferences.setUserId(userId: res.data?.userId ?? "");
        print(UserPreferences.userId + ' customer UserId');
      } else {}
      // return res;
      print(response);
    } catch (error) {
// Handle network errors or exceptions
      print('Error: $error');
      // return Signup(status: 'failed', description: 'Internal server error');
    }
  }

  static Future<void> signOut(context) async {
    try {
      UserPreferences.clearUserData();
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
        (route) => false, // Clear the navigation stack
      );
      print('User signed out successfully');
    } catch (error) {
      print('Error during sign out: $error');
      // Handle errors if needed
    }
  }
}
