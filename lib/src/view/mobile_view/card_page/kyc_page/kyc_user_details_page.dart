import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KycUserDetailsPage extends StatefulWidget {
  const KycUserDetailsPage({super.key});

  @override
  State<KycUserDetailsPage> createState() => _KycUserDetailsPageState();
}

class _KycUserDetailsPageState extends State<KycUserDetailsPage> {
  final TextEditingController mobileNumberTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text('KYC Verification'),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please fill in the details in the form below to proceed',
              style: TextStyle(
                color: Color(0xFF8F8F8F),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            16.verticalSpace,
            Text(
              'Full Name',
              style: TextStyle(
                color: Color(0xFFB6B6B6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            AppTextField(
              borderColor: Color(0xFF2F2F2F),
              fillColor: Colors.transparent,
              hintText: 'Enter your name',
              hintstyle: TextStyle(
                color: Color(0xFF363636),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            3.verticalSpace,
            Text(
              'Mobile No',
              style: TextStyle(
                color: Color(0xFFB6B6B6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            AppTextField(
              keyboardType: TextInputType.number,
              borderColor: Color(0xFF2F2F2F),
              fillColor: Colors.transparent,
              hintText: 'Enter Mobile No',
              hintstyle: TextStyle(
                color: Color(0xFF363636),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                if (mobileNumberTextEditingController.text.length == 10) {
                  Focus.of(context).unfocus();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
