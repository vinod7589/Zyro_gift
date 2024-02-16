import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static late SharedPreferences _preferences;

  static const _otpRefId = 'ref_id';
  static const _userMobile = 'userMobile';
  static const _token = 'token';
  static const _fullName = 'full_Name';
  static const _email = 'email';
  static const _dob = 'date_Of_Birth';
  static const _userId = 'user_Id';
  static const _referalCode = 'referalCode';

  static Future setTempOtpId({required String id}) async {
    await _preferences.setString(_otpRefId, id);
  }

  static Future setUserId({required String userId}) async {
    await _preferences.setString(_userId, userId);
  }

  static Future setUserMobile({String? mobileNumber}) async {
    await _preferences.setString(_userMobile, mobileNumber ?? "");
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

  static Future setReferalCode({required String referaCode}) async {
    await _preferences.setString(_referalCode, referaCode);
  }

  static Future removeRefId() async {
    await _preferences.remove(_otpRefId);
  }

  static Future removeMobileNo() async {
    await _preferences.remove(_userMobile);
  }

  static Future removeUserId() async {
    await _preferences.remove(_userId);
  }

  static Future removeDob() async {
    await _preferences.remove(_dob);
  }

  static String get otpTempId => _preferences.getString(_otpRefId) ?? "";
  static String get tokenId => _preferences.getString(_token) ?? "";
  static String get fullName => _preferences.getString(_fullName) ?? "";
  static String get email => _preferences.getString(_email) ?? "";
  static String get dob => _preferences.getString(_dob) ?? "";
  static String get referalCode => _preferences.getString(_referalCode) ?? "";
  static String get userMobile => _preferences.getString(_userMobile) ?? "";
  static String get userId => _preferences.getString(_userId) ?? "";

  static Future clearUserData() async {
    await _preferences.remove(_otpRefId);
    await _preferences.remove(_userMobile);
    await _preferences.remove(_token);
    await _preferences.remove(_fullName);
    await _preferences.remove(_email);
    await _preferences.remove(_dob);
    await _preferences.remove(_userId);
    await _preferences.remove(_referalCode);
  }
}
