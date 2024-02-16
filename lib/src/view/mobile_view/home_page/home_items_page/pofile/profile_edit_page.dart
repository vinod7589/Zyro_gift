import 'package:abc/src/constants/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/services/shared_preferences.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  /// ///////////////// <-TextEditingController-> /////////////////
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
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
                        controller: emailTextEditingController,
                        // initialValue: isEmail.isNotEmpty
                        //     ? 'Enter your email address'
                        //     : UserPreferences.email,
                        //
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
              ElevatedButton(
                  onPressed: () {
                    UserPreferences.setDob(dob: dobTextEditingController.text);

                    // String formattedDOBAPI = asdfdobTextEditingController.text
                    // api(formattedDOBAPI);
                  },
                  child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
