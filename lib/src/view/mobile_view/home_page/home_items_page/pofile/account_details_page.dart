// ignore_for_file: unrelated_type_equality_checks

import 'package:abc/src/model/auth/get_user_detail_model.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../infrastructure/repository/auth_repo.dart';
import '../../../../../model/auth/registration_model.dart';
import '../../../../Utility/validator.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  AuthRepo auth = AuthRepo();
  final TextEditingController _referralTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _dobTextEditingController =
      TextEditingController();

  bool isEmail = UserPreferences.email.isEmpty ? true : false;
  bool isDob = UserPreferences.dob.isEmpty ? true : false;
  bool isreferral = UserPreferences.referalCode.isEmpty ? true : false;
  String name = "";

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
        _dobTextEditingController.text =
            '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateTimeString = UserPreferences.dob;
    DateTime parseDateTime(String dateTimeString) {
      // Use DateFormat to parse the time directly
      DateTime dateTime =
          DateFormat("M/d/yyyy h:mm:ss a").parse(dateTimeString);
      return dateTime;
    }

    String formatDate(DateTime dateTime) {
      // Format the date as per your requirements
      String formattedDate = DateFormat("d/M/yyyy").format(dateTime);
      return formattedDate;
    }

    DateTime dateTime = parseDateTime(dateTimeString);
    String formattedTime = formatDate(dateTime);

    String dob = '';

    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        appBar: AppBar(
            titleSpacing: 5,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            title: Text(
              'Account Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.11,
                letterSpacing: 0.08,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF454545)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(
                        color: const Color(0xFF676767),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name.isEmpty ? UserPreferences.fullName : 'N/A',
                      style: TextStyle(
                        color: const Color(0xFFBEBEBE),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF454545)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Number',
                      style: TextStyle(
                        color: const Color(0xFF676767),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      UserPreferences.userMobile,
                      style: TextStyle(
                        color: const Color(0xFFBEBEBE),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF454545)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email address',
                      style: TextStyle(
                        color: const Color(0xFF676767),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          child: Text(
                            isEmail
                                ? 'Enter your email address'
                                : UserPreferences.email,
                            style: TextStyle(
                              color: const Color(0xFFBEBEBE),
                              fontSize: 15.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.29,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF2C2C2C),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
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
                                                  margin: const EdgeInsets.only(
                                                      top: 12),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF444444),
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
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: TextFormField(
                                                controller:
                                                    _emailTextEditingController,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Color(0xFFC7C7C7),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Color(0xFFC7C7C7),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 15,
                                                            vertical: 15),
                                                    hintStyle: TextStyle(
                                                      color: const Color(
                                                          0xFFBEBEBE),
                                                      fontSize: 15.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    hintText:
                                                        "Enter your email address",
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Color(0xFFC7C7C7),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    )),
                                                validator: (value) {
                                                  return Validator
                                                      .validateEmail(
                                                    value ?? "",
                                                  );
                                                },
                                              ),
                                            ),
                                            20.verticalSpace,
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    height: 51,
                                                    child: ElevatedButton(
                                                        onPressed: () async {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            _formKey
                                                                .currentState!
                                                                .save();
                                                            Signup? res =
                                                                await auth.signUp(
                                                                    '',
                                                                    _emailTextEditingController
                                                                        .text,
                                                                    dob,
                                                                    '',
                                                                    context);
                                                            if (res?.status ==
                                                                'success') {
                                                              await auth
                                                                  .getUserDetail();
                                                              Navigator.pop(
                                                                  context);
                                                              // Navigator.pushReplacement(
                                                              //     context,
                                                              //     MaterialPageRoute(
                                                              //         builder: (context) =>
                                                              //             LandingPage()));
                                                            }
                                                          }
                                                        },
                                                        child: Text(
                                                          'Update',
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF2C2C2C),
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.08,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            15.verticalSpace,
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
                                    'Add',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFFAC61FF),
                                        fontSize: 15.sp),
                                  )
                                : const Text(''),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF454545)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date Of Birth',
                      style: TextStyle(
                        color: const Color(0xFF676767),
                        fontSize: 15.sp,
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
                            isDob ? 'N/A' : formattedTime,
                            style: TextStyle(
                              color: const Color(0xFFBEBEBE),
                              fontSize: 15.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
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
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF2C2C2C),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
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
                                                  margin: const EdgeInsets.only(
                                                      top: 12),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF444444),
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
                                              'Date Of Birth',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.40,
                                              ),
                                            ),
                                            20.verticalSpace,
                                            InkWell(
                                              onTap: () {
                                                _selectDate(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.white,
                                                    ),
                                                    15.horizontalSpace,
                                                    Text(
                                                      'Add your Date of Birth',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    )
                                                  ],
                                                ),
                                                height: 47.h,
                                              ),
                                            ),
                                            // Padding(

                                            //   padding:
                                            //       const EdgeInsets.only(top: 10),
                                            //   child: TextFormField(
                                            //     controller:
                                            //         _dobTextEditingController,
                                            //     style: const TextStyle(
                                            //         color: Colors.white),
                                            //     decoration: InputDecoration(
                                            //         enabledBorder:
                                            //             OutlineInputBorder(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   8),
                                            //           borderSide:
                                            //               const BorderSide(
                                            //             color: Color(0xFFC7C7C7),
                                            //           ),
                                            //         ),
                                            //         focusedBorder:
                                            //             OutlineInputBorder(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   8),
                                            //           borderSide:
                                            //               const BorderSide(
                                            //             color: Color(0xFFC7C7C7),
                                            //           ),
                                            //         ),
                                            //         contentPadding:
                                            //             const EdgeInsets
                                            //                     .symmetric(
                                            //                 horizontal: 15,
                                            //                 vertical: 15),
                                            //         hintStyle: TextStyle(
                                            //           color:
                                            //               const Color(0xFFBEBEBE),
                                            //           fontSize: 15.sp,
                                            //           fontFamily: 'Poppins',
                                            //           fontWeight: FontWeight.w500,
                                            //         ),
                                            //         hintText:
                                            //             "Enter your Date of birth",
                                            //         border: OutlineInputBorder(
                                            //           borderSide:
                                            //               const BorderSide(
                                            //             color: Color(0xFFC7C7C7),
                                            //           ),
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   8),
                                            //         )),
                                            //   ),
                                            // ),
                                            20.verticalSpace,
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    height: 51,
                                                    child: ElevatedButton(
                                                        onPressed: () async {
                                                          // if (_formKey
                                                          //     .currentState!
                                                          //     .validate()) {
                                                          //   _formKey
                                                          //       .currentState!
                                                          //       .save();
                                                          //   Signup? res = await auth.signUp(
                                                          //       UserPreferences
                                                          //           .fullName,
                                                          //       UserPreferences
                                                          //           .email,
                                                          //       _dobTextEditingController
                                                          //           .text,
                                                          //       '',
                                                          //       context);
                                                          //   if (res?.status ==
                                                          //       'success') {
                                                          //     UserPreferences.setDob(
                                                          //         dob: _dobTextEditingController
                                                          //             .text);
                                                          //
                                                          //     Navigator.pop(
                                                          //         context);
                                                          //   }
                                                          // }
                                                          // Navigator.pop(
                                                          //     context);
                                                        },
                                                        child: Text(
                                                          'Update',
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF2C2C2C),
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.08,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            15.verticalSpace,
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
                                    'Add',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFFAC61FF),
                                        fontSize: 15.sp),
                                  )
                                : const Text(''),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20),
              //   width: double.infinity,
              //   decoration: ShapeDecoration(
              //     shape: RoundedRectangleBorder(
              //       side: const BorderSide(color: Color(0xFF454545)),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              //   child: Row(
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Referral Code',
              //             style: TextStyle(
              //               color: const Color(0xFF676767),
              //               fontSize: 15.sp,
              //               fontFamily: 'Poppins',
              //               fontWeight: FontWeight.w500,
              //               height: 1.29,
              //             ),
              //           ),
              //           4.verticalSpace,
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Text(
              //                 isreferral ? 'N/A' : UserPreferences.referalCode,
              //                 style: TextStyle(
              //                   color: const Color(0xFFBEBEBE),
              //                   fontSize: 15.sp,
              //                   fontFamily: 'Poppins',
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 30),
              //         child: InkWell(
              //           onTap: () {
              //             showModalBottomSheet(
              //               isScrollControlled: true,
              //               context: context,
              //               builder: (BuildContext context) {
              //                 return Container(
              //                   padding: EdgeInsets.only(
              //                       bottom:
              //                           MediaQuery.of(context).viewInsets.bottom),
              //                   decoration: const BoxDecoration(
              //                       color: Color(0xFF2C2C2C),
              //                       borderRadius: BorderRadius.only(
              //                           topRight: Radius.circular(12),
              //                           topLeft: Radius.circular(12))),
              //                   // Customize the content of your bottom sheet here
              //                   child: SingleChildScrollView(
              //                     scrollDirection: Axis.vertical,
              //                     child: Padding(
              //                       padding: const EdgeInsets.only(
              //                           left: 25, right: 25, bottom: 20),
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: [
              //                               Container(
              //                                 margin:
              //                                     const EdgeInsets.only(top: 12),
              //                                 decoration: BoxDecoration(
              //                                     color: const Color(0xFF444444),
              //                                     borderRadius:
              //                                         BorderRadius.circular(30)),
              //                                 height: 5,
              //                                 width: 100,
              //                               ),
              //                             ],
              //                           ),
              //                           const SizedBox(
              //                             height: 30,
              //                           ),
              //                           const Text(
              //                             'Referral Code',
              //                             style: TextStyle(
              //                               color: Colors.white,
              //                               fontSize: 20,
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w500,
              //                               letterSpacing: 0.40,
              //                             ),
              //                           ),
              //                           const SizedBox(
              //                             height: 5,
              //                           ),
              //                           const Text(
              //                             'Referral Code is shared by your friend or family who recommended Zyro Gift to you ',
              //                             style: TextStyle(
              //                               color: Color(0xFFCDCDCD),
              //                               fontSize: 11,
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w400,
              //                               letterSpacing: 0.22,
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: const EdgeInsets.only(top: 25),
              //                             child: TextFormField(
              //                               controller:
              //                                   _referralTextEditingController,
              //                               style: const TextStyle(
              //                                   color: Colors.white),
              //                               maxLength: 8,
              //                               decoration: InputDecoration(
              //                                   enabledBorder: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                     borderSide: const BorderSide(
              //                                       color: Color(0xFFC7C7C7),
              //                                     ),
              //                                   ),
              //                                   focusedBorder: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                     borderSide: const BorderSide(
              //                                       color: Color(0xFFC7C7C7),
              //                                     ),
              //                                   ),
              //                                   hintStyle: TextStyle(
              //                                     color: const Color(0xFFBEBEBE),
              //                                     fontSize: 15.sp,
              //                                     fontWeight: FontWeight.w500,
              //                                   ),
              //                                   hintText: "Enter referral Code",
              //                                   border: OutlineInputBorder(
              //                                     borderSide: const BorderSide(
              //                                       color: Color(0xFFC7C7C7),
              //                                     ),
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                   )),
              //                             ),
              //                           ),
              //                           Row(
              //                             children: [
              //                               Expanded(
              //                                 child: Container(
              //                                   margin: const EdgeInsets.only(
              //                                       top: 20),
              //                                   height: 51,
              //                                   child: ElevatedButton(
              //                                       onPressed: () {
              //                                         isreferral ==
              //                                             UserPreferences
              //                                                 .setReferalCode(
              //                                                     referaCode:
              //                                                         _referralTextEditingController
              //                                                             .text);
              //                                         UserPreferences.referalCode;
              //                                         if (kDebugMode) {
              //                                           print(UserPreferences
              //                                               .referalCode);
              //                                           _referralTextEditingController
              //                                               .clear();
              //                                         }
              //
              //                                         Navigator.of(context).pop();
              //                                       },
              //                                       child: const Text(
              //                                         'Submit',
              //                                         style: TextStyle(
              //                                           color: Color(0xFF2C2C2C),
              //                                           fontSize: 16,
              //                                           fontFamily: 'Poppins',
              //                                           fontWeight:
              //                                               FontWeight.w600,
              //                                           height: 1.11,
              //                                           letterSpacing: 0.08,
              //                                         ),
              //                                       )),
              //                                 ),
              //                               ),
              //                             ],
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 );
              //               },
              //             );
              //           },
              //           child: isreferral
              //               ? Image.asset(
              //                   'assets/images/addimage.png',
              //                   height: 22.h,
              //                 )
              //               : const Text(''),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ]),
          ),
        ));
  }
}
