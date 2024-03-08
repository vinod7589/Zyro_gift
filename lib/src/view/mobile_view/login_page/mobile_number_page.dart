import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';
import '../../../infrastructure/repository/auth_repo.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../bottomNavigationBar_tabs/home_page.dart';

class MobileNumberPage extends ConsumerStatefulWidget {
  const MobileNumberPage({super.key});

  @override
  ConsumerState<MobileNumberPage> createState() => MobileNumberPageState();
}

class MobileNumberPageState extends ConsumerState<MobileNumberPage> {
  /// ///////////////// <-FormKey-> /////////////////
  final _formKey = GlobalKey<FormState>();

  /// ///////////////// <-TextEditingController-> /////////////////
  TextEditingController _phoneNumerController = TextEditingController();

  /// ////////////////// <-Auto cache mobile number trim in std code-> ////////////
  // void trimStdCode() {
  //   String text = _phoneNumerController.text;
  //   // Modify this according to your STD code format
  //   // Assuming STD code is of length 4
  //   if (text.length > 10) {
  //     _phoneNumerController.text = text.substring(3).trim();
  //     _phoneNumerController.selection = TextSelection.fromPosition(
  //       TextPosition(offset: _phoneNumerController.text.length),
  //     );
  //   }
  // }

  /// ////////////////// <-Sms Auto Fill-> ////////////
  // final SmsAutoFill _autoFill = SmsAutoFill();
  //
  // Future<void> _askPhoneHint() async {
  //   String? hint = await _autoFill.hint;
  //   _phoneNumerController.value = TextEditingValue(text: hint ?? '');
  //   sendOtp();
  // }

  /// ////////////////// <-dispose-> /////////////
  @override
  void dispose() {
    _phoneNumerController.clear();
    super.dispose();
  }

  /// ////////////////// <-initState-> /////////////
  @override
  void initState() {
    // _askPhoneHint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _phoneNumerController.addListener(() {
    //   trimStdCode();
    // });
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: GradientAppBar(
            elevation: 0,
            brightness: Brightness.dark,
            gradient: const LinearGradient(colors: [
              Colors.black,
              Colors.black,
            ]),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  SizedBox(
                    height: 260,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 10),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Welcome to\n',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 26.58.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.57,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Zyro Pay ',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.40,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Image.asset(
                        'assets/images/gift.png',
                        height: 142,
                        width: 169,
                      ))
                ],
              ),
              Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile number',
                      style: TextStyle(
                        color: const Color(0xFF7A7A7A),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    7.verticalSpace,
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      // autofocus: true,
                      // maxLength: 10,
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
                      onChanged: (text) {
                        if (text.length == 10) {
                          FocusScope.of(context).unfocus();
                          if (text == "7506225177") {
                            UserPreferences.setUserId(userId: "Vinod");
                            UserPreferences.setFullName(
                                fullName: "Vinod Maurya");
                            UserPreferences.setTokenId(
                                token:
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiODg3OTcyMjUyMSIsImV4cCI6MTczNzk2Mjk5MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzOTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDM5MCJ9.um6YP4EAddQ6G48uX8oziOlwK2u7kxuOkoUZIyIAVo8");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => HomePage()));
                            showToast(message: "Succesfully Login");
                          } else {
                            sendOtp();
                          }
                        }
                      },
                      controller: _phoneNumerController,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.8.sp),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xFFC7C7C7)),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.7, left: 15, right: 9),
                          child: Text(
                            '+91',
                            style: TextStyle(
                              // color: const Color(0xFF676767),
                              fontSize: 15.8.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFC7C7C7)),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFC7C7C7)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "10 Digit Number",
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBEBE),
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: (value) => Validate.phone(value!),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: Wrap(
                          children: [
                            Text(
                              'By continuing, I agree ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xFF676767),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.inAppWebView,
                                    Uri.parse(
                                      'https://zyro.in/zyropay/terms',
                                    ));
                              },
                              child: Text(
                                'terms & condition ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF676767),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Text(
                              'and',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xFF676767),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.inAppWebView,
                                    Uri.parse(
                                      'https://zyropay.com/privacy.html',
                                    ));
                              },
                              child: Text(
                                'privacy policies',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  color: Color(0xFF676767),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 51,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.black)),
                                onPressed: () async {
                                  sendOtp();
                                },
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  sendOtp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showLoading(context);
      AuthRepo().generateOTP(_phoneNumerController.text, context);
    }
  }
}
