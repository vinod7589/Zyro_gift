import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/dialogs/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';
import '../../../infrastructure/repository/auth_repo.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class MobileNumberPage extends ConsumerStatefulWidget {
  const MobileNumberPage({super.key});

  @override
  ConsumerState<MobileNumberPage> createState() => MobileNumberPageState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController _phoneNumerController = TextEditingController();

class MobileNumberPageState extends ConsumerState<MobileNumberPage> {
  @override
  void dispose() {
    _phoneNumerController.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      // maxLength: 10,
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
                      onChanged: (text) {
                        if (text.length == 10) {
                          FocusScope.of(context).unfocus();
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
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'By continuing, I agree ',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF676767),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'terms & condition',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF676767),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  color: Color(0xFF676767),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'privacy policies',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  color: Color(0xFF676767),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  color: Color(0xFF676767),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
