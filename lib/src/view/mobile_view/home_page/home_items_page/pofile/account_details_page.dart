import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  TextEditingController referralTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();

  bool isEmail = UserPreferences.email.isEmpty ? true : false;
  bool isreferral = UserPreferences.referalCode.isEmpty ? true : false;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        appBar: AppBar(
            titleSpacing: 5,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            title: Text(
              'Account Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.11,
                letterSpacing: 0.08,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name.isEmpty ? UserPreferences.fullName : 'N/A',
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Number',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    UserPreferences.userMobile,
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email address',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: 260,
                        child: Text(
                          isEmail ? 'N/A' : UserPreferences.email,
                          style: TextStyle(
                            color: Color(0xFFBEBEBE),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.29,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2C2C2C),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  // Customize the content of your bottom sheet here
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25, bottom: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 12),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF444444),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                height: 5,
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                          30.verticalSpace,
                                          Text(
                                            'Email address',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.40,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: TextFormField(
                                              controller:
                                                  emailTextEditingController,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFC7C7C7),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFC7C7C7),
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFFBEBEBE),
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  hintText:
                                                      "Enter your email address",
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFC7C7C7),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  )),
                                            ),
                                          ),
                                          20.verticalSpace,
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  height: 51,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isEmail ==
                                                              UserPreferences.setEmail(
                                                                  email:
                                                                      emailTextEditingController
                                                                          .text);
                                                          emailTextEditingController
                                                              .clear();
                                                          print(UserPreferences
                                                              .email);

                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                      child: Text(
                                                        'Update',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C2C2C),
                                                          fontSize: 16.sp,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0.08,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: isEmail
                              ? Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFAC61FF),
                                      fontSize: 15.sp),
                                )
                              : Text(''),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Referral Code',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.29,
                        ),
                      ),
                      4.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isreferral ? 'N/A' : UserPreferences.referalCode,
                            style: TextStyle(
                              color: Color(0xFFBEBEBE),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.29,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              decoration: BoxDecoration(
                                  color: Color(0xFF2C2C2C),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12))),
                              // Customize the content of your bottom sheet here
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 12),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF444444),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            height: 5,
                                            width: 100,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Referral Code',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.40,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Referral Code is shared by your friend or family who recommended Zyro Gift to you ',
                                        style: TextStyle(
                                          color: Color(0xFFCDCDCD),
                                          fontSize: 11,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.22,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: TextFormField(
                                          controller:
                                              referralTextEditingController,
                                          style: TextStyle(color: Colors.white),
                                          maxLength: 8,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFC7C7C7),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFC7C7C7),
                                                ),
                                              ),
                                              hintStyle: const TextStyle(
                                                color: Color(0xFFBEBEBE),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                height: 1.29,
                                              ),
                                              hintText: "Enter referral Code",
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFC7C7C7),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              height: 51,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    isreferral ==
                                                        UserPreferences
                                                            .setReferalCole(
                                                                referaCode:
                                                                    referralTextEditingController
                                                                        .text);
                                                    UserPreferences.referalCode;
                                                    print(UserPreferences
                                                        .referalCode);
                                                    referralTextEditingController
                                                        .clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Submit',
                                                    style: TextStyle(
                                                      color: Color(0xFF2C2C2C),
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.11,
                                                      letterSpacing: 0.08,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: isreferral
                          ? Image.asset(
                              'assets/images/addimage.png',
                              height: 22.h,
                            )
                          : Text(''),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
