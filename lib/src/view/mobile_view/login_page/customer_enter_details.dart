import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/page_padding.dart';
import '../../../infrastructure/repository/auth_repo.dart';
import '../../../model/auth/registration_model.dart';
import '../../Utility/validator.dart';
import '../widgets/landingpage.dart';

class CustomerEnterDetails extends StatefulWidget {
  CustomerEnterDetails({super.key});

  @override
  State<CustomerEnterDetails> createState() => _CustomerEnterDetailsState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _referralCode = TextEditingController();
TextEditingController _dateOfBirth = TextEditingController();

class _CustomerEnterDetailsState extends State<CustomerEnterDetails> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullName.clear();
    _email.clear();
    _referralCode.clear();
    _dateOfBirth.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome!\n',
                          style: TextStyle(
                            color: Color(0xFF212427),
                            fontSize: 28.58,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Lets get to know you better',
                          style: TextStyle(
                            color: Color(0xFF212427),
                            fontSize: 20,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Full Name *',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      // auoFocus: true,
                      textController: _fullName,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your name',
                      validator: (value) {
                        return Validator.validateName(
                            value ?? "", 1, 'Full Name');
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Email address',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      textController: _email,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your email address',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Date Of Birth',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      textController: _dateOfBirth,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your date of birth',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Referral Code (Optional) ',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    6.verticalSpace,
                    AppTextField(
                      textController: _referralCode,
                      hintstyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Enter your referral code here',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Referral code is shared by your friends or family who recommended Zyro gifts to you.',
                        style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
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
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Signup? res = await AuthRepo.signUp(
                                          _fullName.text,
                                          _email.text,
                                          _dateOfBirth.text,
                                          _referralCode.text,
                                          context);
                                      if (res?.status == 'success') {
                                        await AuthRepo.getUserDetail();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    landingPage()));
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
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
