import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static late SharedPreferences _preferences;

  static const _otpRefId = 'ref_id';
  static const _mobileNo = 'mobile_No';
  static const _token = 'token';
  static const _fullName = 'full_Name';
  static const _email = 'email';
  static const _dob = 'date_Of_Birth';
  static const _referalCode = 'referalCode';

  static Future setTempOtpId({required String id}) async {
    await _preferences.setString(_otpRefId, id);
  }

  static Future setMobileNoForOtp({required String mobile}) async {
    await _preferences.setString(_mobileNo, mobile);
  }

  static Future setTokenId({required String token}) async {
    await _preferences.setString(_token, token);
  }

  static Future setFullName({required String fullName}) async {
    await _preferences.setString(_fullName, fullName);
  }

  static Future setEmail({required String email}) async {
    await _preferences.setString(_email, email);
  }

  static Future setDob({required String dob}) async {
    await _preferences.setString(_dob, dob);
  }

  static Future setReferalCole({required String referaCode}) async {
    await _preferences.setString(_referalCode, referaCode);
  }

  static Future removeRefId() async {
    await _preferences.remove(_otpRefId);
  }

  static Future removeMobileNoForOtp() async {
    await _preferences.remove(_mobileNo);
  }

  static String get otpTempId => _preferences.getString(_otpRefId) ?? "";
  static String get mobileNoForOtp => _preferences.getString(_mobileNo) ?? "";
  static String get tokenId => _preferences.getString(_token) ?? "";
  static String get fullName => _preferences.getString(_fullName) ?? "";
  static String get email => _preferences.getString(_email) ?? "";
  static String get dob => _preferences.getString(_dob) ?? "";
  static String get referalCode => _preferences.getString(_referalCode) ?? "";
}
