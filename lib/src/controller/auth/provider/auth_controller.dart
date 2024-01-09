// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../global_providers.dart';
// import '../../../global_providers.dart';
// import '../../../util/services/shared_preferences.dart';
// import '../state/auth_state.dart';
//
// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier(this._read) : super(const AuthState.signOut()) {
//     _initState();
//   }
//
//   final Reader _read;
//
//   void _initState() {
//     // state = UserPreferences.accessToken.isNotEmpty
//     //     ? const AuthState.signIn()
//     //     : const AuthState.signOut();
//   }
//
//   Future<List<String>> generateOtp({
//     required String mobileNo,
//   }) async {
//     // UserPreferences.removeTempOtpId();
//
//     final List<String> authRes;
//     authRes = await _read(authProvider).generateOtp(mobileNo: mobileNo);
//     if (authRes[2] != '') {
//       await UserPreferences.setTempOtpId(id: authRes[2]);
//     }
//     return authRes;
//   }
//
//   Future<List<String>> verifyEmail({
//     required String email,
//   }) async {
//     final List<String> authRes;
//     authRes = await _read(authProvider).verifyEmail(email: email);
//
//     return authRes;
//   }
//
//   Future<List<String>> verifyMobileNo({
//     required String phoneNo,
//   }) async {
//     final List<String> authRes;
//     authRes = await _read(authProvider).verifyPhone(phoneNo: phoneNo);
//
//     return authRes;
//   }
//
//   Future<List<String>> verifyOTP({
//     required String otp,
//     required String smstoken,
//   }) async {
//     final List<String> authRes;
//
//     authRes = await _read(authProvider).verifyOTP(otp: otp, smstoken: smstoken);
//     return authRes;
//   }
//
//   Future<List<String>> registration({
//     required String mobileNo,
//     required String password,
//     required String name,
//     required String company,
//     required String emailId,
//     required String industry,
//     required String businessType,
//     required String referralCode,
//   }) async {
//     final List<String> authRes;
//
//     authRes = await _read(authProvider).registration(
//         mobileNo: mobileNo,
//         password: password,
//         name: name,
//         company: company,
//         emailId: emailId,
//         industry: industry,
//         businessType: businessType,
//         referalCode: referralCode
//         // gstIn: gstIn,
//         // pan: pan
//         );
//     return authRes;
//   }
//
//   // Future <List<String>> login({
//   //   required String password,
//   //   required String emailId,
//   // }) async {
//   //   final List<String> authRes;
//   //
//   //   authRes = await _read(authProvider).login(
//   //     password: password,
//   //     emailId: emailId,
//   //   );
//   //   saveDecrptedData(authRes[1]);
//   //   print(authRes[1]);
//   //   return authRes;
//   // }
//   // //
//   // Future<LoginResponseModel> saveDecrptedData(String decrptedDataString) async {
//   //   Map<String,dynamic> valueMap = json.decode(decrptedDataString);
//   //   final loginResponse= await LoginResponseModel.fromJson(valueMap);
//   //   print(loginResponse.EmailId);
//   //   print(loginResponse.Name);
//   //   print(loginResponse.WalletId);
//   //
//   //   return loginResponse;
//   // }
//
//   //
//   // Future<String?> signup(String mobileNo) async {
//   //   return _read(authProvider).signup(mobileNo);
//   // }
//   //
//   // Future<String?> login(String mobileNo) async {
//   //   return _read(authProvider).login(mobileNo);
//   // }
//   //
//
//   //
//   // Future<void> loginVerifyOTP({
//   //   required String mobileNo,
//   //   required String otp,
//   //   required String smstoken,
//   // }) async {
//   //   final res = await _read(authProvider)
//   //       .loginVerifyOTP(mobileNo: mobileNo, otp: otp, smstoken: smstoken);
//   //   if (res != null) {
//   //     await UserPreferences.setUser(
//   //       userId: res.userId,
//   //       // accessToken: res.token,
//   //     );
//   //     await UserPreferences.setRegistered(
//   //       registered: res.hasRegistered ?? false,
//   //     );
//   //     state = const AuthState.signIn();
//   //   }
//   // }
//
//   // Future<void> setProfilePic(File? image) async {
//   //   await _read(authProvider).setProfileImage(image);
//   // }
//   // //
//   // Future<void> registrationForm(
//   //     {required RegistrationFormModel user, File? image}) async {
//   //   await _read(authProvider).registrationForm(user: user, image: image);
//   // }
//
//   // Future<bool> checkReferral(String referralCode) async {
//   //   return _read(authProvider).checkReferral(referralCode);
//   // }
//   //
//   // Future<List<dynamic>> getUsernameSuggestions({required String name}) async {
//   //   List<dynamic> _nameList = [];
//   //   _nameList = await _read(authProvider).getUsernameSuggestions(name: name);
//   //   return _nameList;
//   // }
//
//   Future<void> logout() async {
//     // await UserPreferences.removeUser();
//     state = const AuthState.signOut();
//   }
// }
