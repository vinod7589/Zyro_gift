import 'package:abc/src/constants/height.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../infrastructure/repository/auth_repo.dart';
import '../../../../../model/auth/registration_model.dart';
import '../../../../../util/services/shared_preferences.dart';
import '../../../../Utility/validator.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  /// ///////////////// <-AuthRepo-> /////////////////
  AuthRepo auth = AuthRepo();

  /// ///////////////// <-formKey-> /////////////////
  final formKey = GlobalKey<FormState>();

  /// ///////////////// <-TextEditingController-> /////////////////
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();

  Future<void> _selectDate(context) async {
    DateTime selectedDate = DateTime.now();

    /// ///////////////// <-Date Time Picker-> /////////////////
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobTextEditingController.text =
            "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}";
      });
    }
  }

  /// ////////////////// <-initState-> /////////////
  @override
  void initState() {
    setState(() {
      nameTextEditingController.text = UserPreferences.fullName;
      mobileNumberTextEditingController.text = UserPreferences.userMobile;
      emailTextEditingController.text = UserPreferences.email;
      if (UserPreferences.dob.isEmpty) {
        dobTextEditingController.text = "N/A";
      } else {
        dobTextEditingController.text = UserPreferences.dob;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Details',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.08,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 12, left: 20),
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
                      SizedBox(
                        height: 25,
                        child: TextFormField(
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          keyboardType: TextInputType.emailAddress,
                          controller: nameTextEditingController,
                          autofocus: true,
                          style: TextStyle(
                            color: const Color(0xFFBEBEBE),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              hintText: 'Name',
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(color: Colors.white30)),
                          validator: (value) {
                            return Validator.validateName(
                                value ?? "", 1, 'Full Name');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 12, left: 20),
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
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 25,
                        child: TextFormField(
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          controller: emailTextEditingController,
                          style: TextStyle(
                            color: const Color(0xFFBEBEBE),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              hintText: 'N/A',
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 12, left: 20),
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
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 25,
                        child: TextFormField(
                          controller: dobTextEditingController,
                          readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                          style: TextStyle(
                            color: const Color(0xFFBEBEBE),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              hintText: 'dob',
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(color: Colors.white30)),
                        ),
                      ),
                    ],
                  ),
                ),
                50.verticalSpace,
                SizedBox(
                  height: Height.ButtonHeight,
                  width: 200.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Signup? res = await auth.signUp(
                              nameTextEditingController.text,
                              emailTextEditingController.text,
                              dobTextEditingController.text,
                              '');
                          if (res?.status == 'success') {
                            UserPreferences.setFullName(
                                fullName: nameTextEditingController.text);
                            UserPreferences.setEmail(
                                email: emailTextEditingController.text);
                            UserPreferences.setDob(
                                dob: dobTextEditingController.text);
                            // auth.getUserDetail();
                            Navigator.pop(context);
                          }
                        }
                        ;
                        // UserPreferences.setDob(
                        //     dob: dobTextEditingController.text);

                        // String formattedDOBAPI = asdfdobTextEditingController.text
                        // api(formattedDOBAPI);
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 16.sp),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
