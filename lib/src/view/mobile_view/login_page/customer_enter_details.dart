import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../constants/page_padding.dart';
import '../../../infrastructure/repository/auth_repo.dart';
import '../../../model/auth/get_user_detail_model.dart';
import '../../../model/auth/registration_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../Utility/validator.dart';
import '../bottomNavigationBar.dart';

class CustomerEnterDetails extends ConsumerStatefulWidget {
  CustomerEnterDetails({super.key});

  @override
  ConsumerState<CustomerEnterDetails> createState() =>
      _CustomerEnterDetailsState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _referralCode = TextEditingController();
TextEditingController _dateOfBirth = TextEditingController();

class _CustomerEnterDetailsState extends ConsumerState<CustomerEnterDetails> {
  AuthRepo auth = AuthRepo();
  @override
  void dispose() {
    super.dispose();
    // _fullName.clear();
    // _email.clear();
    // _referralCode.clear();
    // _dateOfBirth.clear();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateOfBirth.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome!\n',
                          style: TextStyle(
                            color: Color(0xFF212427),
                            fontSize: 28.58.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Lets get to know you better',
                          style: TextStyle(
                            color: Color(0xFF212427),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                40.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Full Name',
                              style: TextStyle(
                                color: Color(0xFF676767),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: Color(
                                    0xFFB91E1E), // Change the color as per your preference
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      // auoFocus: true,
                      textController: _fullName,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15.sp.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your name',
                      validator: (value) {
                        return Validator.validateName(
                            value ?? "", 1, 'Full Name');
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Email address',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      textController: _email,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your email address',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Date Of Birth',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      readOnly: true,

                      // onChanged: () => selectDate(context),
                      prefixIcon: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Icon(Icons.calendar_today),
                      ),
                      // onChanged: _selectDate(context),
                      // readOnly: true,
                      textController: _dateOfBirth,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your date of birth',
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   child: Text(
                    //     'Referral Code (Optional) ',
                    //     style: TextStyle(
                    //       color: Color(0xFF676767),
                    //       fontSize: 15.sp,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // 6.verticalSpace,
                    // AppTextField(
                    //   textController: _referralCode,
                    //   hintstyle: TextStyle(
                    //     color: Color(0xFFBEBEBE),
                    //     fontSize: 15.sp,
                    //     fontFamily: 'Poppins',
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    //   hintText: 'Enter your referral code here',
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 10),
                    //   child: Text(
                    //     'Referral code is shared by your friends or family who recommended Zyro pay to you.',
                    //     style: TextStyle(
                    //       color: Color(0xFF7A7A7A),
                    //       fontSize: 13.sp,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 25),
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () async {
                                    // is Loading
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Signup? res = await auth.signUp(
                                        _fullName.text,
                                        _email.text,
                                        _dateOfBirth.text,
                                        _referralCode.text,
                                      );
                                      if (res?.status == 'success') {
                                        await auth.getUserDetail();
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LandingPage()),
                                          (Route<dynamic> route) => false,
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
