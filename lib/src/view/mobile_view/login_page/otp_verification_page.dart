import 'dart:async';

import 'package:abc/src/infrastructure/repository/auth_repo.dart';
import 'package:abc/src/view/widgets/dialogs/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widgets/dialogs/loader.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage();

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  AuthRepo auth = AuthRepo();

  final _formKey = GlobalKey<FormState>();
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpControllers;
  String otp = "";

  @override
  void initState() {
    resentEnabled = false;
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _otpControllers = List.generate(4, (index) => TextEditingController());

    for (int i = 0; i < _focusNodes.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.length == 1 && i < _focusNodes.length - 1) {
          _focusNodes[i].unfocus();
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        } else if (_otpControllers[i].text.length == 1 &&
            i == _focusNodes.length - 1) {
          _focusNodes[i].unfocus();
          // widget.onFieldSubmitted(
          _otpControllers.map((controller) => controller.text).join();
        }
      });
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          resentEnabled = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].dispose();
      _otpControllers[i].dispose();
    }
    timer.cancel();
    super.dispose();
  }

  void clearOtpField() {
    for (var controller in _otpControllers) {
      controller.text = "";
    }
  }

  int secondsRemaining = 30;
  bool resentEnabled = true;
  late Timer timer;

  void _count() {
    secondsRemaining = 30;

    resentEnabled = false;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {});
        resentEnabled = true;
        timer.cancel();
      }
    });
    //other code here
    // setState(() {
    //   // secondsRemaining = 30;
    //   resentEnabled = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 212,
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Text(
                          'Zyro Pay',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.36,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'enter the OTP sent to',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.40,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '+91 ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    UserPreferences.userMobile,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 82,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        4,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 50,
                          height: 60,
                          child: TextFormField(
                            autofocus: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFC7C7C7))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFC7C7C7)))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 6.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      'didn’t receive OTP? ',
                      style: TextStyle(
                        color: Color(0xFFB5B5B5),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: resentEnabled
                          ? () {
                              AuthRepo().resendOtp(context);
                              _count();

                              clearOtpField();
                            }
                          : null,
                      child: Text(
                        resentEnabled
                            ? 'Resend OTP '
                            : secondsRemaining.toString(),
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: resentEnabled
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 51,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.black)),
                                onPressed: () {
                                  submitOtp();
                                },
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  submitOtp() async {
    bool isOtpFilled = true;

    // Check if any OTP field is empty
    for (var element in _otpControllers) {
      if (element.text.isEmpty) {
        isOtpFilled = false;
        break;
      }
    }

    if (isOtpFilled) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        for (var element in _otpControllers) {
          String tempOtp = element.text;
          otp = "$otp$tempOtp";
          tempOtp = "";
        }
        showLoading(context);
        await auth.verifyOTP(
          otp: otp,
          refId: UserPreferences.otpTempId,
          context: context,
        );
        otp = "";
      } else {
        // Handle form validation errors if needed
      }
    } else {
      // OTP fields are not filled
      // You can display an error message or handle it according to your UI flow
      print('Please fill all OTP fields');
    }
  }

  // submitOtp() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     for (var element in _otpControllers) {
  //       String tempOtp = element.text;
  //       otp = "${otp}$tempOtp";
  //       tempOtp = "";
  //     }
  //     showLoading(context);
  //     await AuthRepo().verifyOTP(
  //         otp: otp, refId: UserPreferences.otpTempId, context: context);
  //     otp = "";
  //   } else {}
  // }
}
