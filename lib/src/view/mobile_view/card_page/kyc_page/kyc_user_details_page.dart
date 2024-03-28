import 'package:abc/src/constants/height.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/controller/pinelab_kyc_controller.dart';
import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../infrastructure/repository/pinelab_kyc_repo.dart';
import '../../../../model/pinelab_kyc_model/pinelab_fullkyc_model.dart';
import '../../../../model/pinelab_kyc_model/pinelab_kyc_token_generate_model.dart';
import '../../../../model/pinelab_kyc_model/pinelab_minkyc_model.dart';
import '../../../../util/services/shared_preferences.dart';
import '../../../Utility/validator.dart';
import '../../../widgets/dialogs/loading_dialog.dart';

class KycUserDetailsPage extends ConsumerStatefulWidget {
  final bool isSelected;

  const KycUserDetailsPage({super.key, required this.isSelected});

  @override
  ConsumerState<KycUserDetailsPage> createState() => _KycUserDetailsPageState();
}

class _KycUserDetailsPageState extends ConsumerState<KycUserDetailsPage> {
  @override
  void initState() {
    widget.isSelected;
    if (kDebugMode) {
      print(widget.isSelected == true
          ? 'Min Kyc Selected '
          : 'Full Kyc Selected');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pineLabCtr = ref.watch(pineLabController);
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimationButton(
            onPress: () async {
              if (pineLabCtr.formKey.currentState!.validate()) {
                if (widget.isSelected) {
                  showLoading(context);
                  minKycService();
                } else {
                  showLoading(context);
                  fullKycService();
                }
              }
            },
            width: Height.ButtonWidth,
            title: pineLabCtr.isLoading ? 'Please Wait' : 'Continue',
            loader: pineLabCtr.isLoading
                ? LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.black,
                    size: 30.h,
                  )
                : SizedBox(),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          11.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Issued by',
                  style: TextStyle(
                    color: const Color(0xFFBEBEBE),
                    fontSize: 9.64.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: const Color(0xFFBEBEBE),
                    fontSize: 12.05.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Pine Labs',
                  style: TextStyle(
                    color: const Color(0xFF0E761E),
                    fontSize: 12.05.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
        ],
      ),
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Form(
            key: pineLabCtr.formKey,
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
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                AppTextField(
                  textController: pineLabCtr.fullNameTextEditingController,
                  borderColor: Color(0xFF2F2F2F),
                  fillColor: Colors.transparent,
                  hintText: 'Enter your name',
                  hintstyle: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  validator: (value) {
                    return Validator.validateName(value ?? "", 1, 'Full Name');
                  },
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Mobile No',
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                AppTextField(
                  validator: (value) {
                    return Validator.phone(
                      value ?? '',
                    );
                  },
                  textController: pineLabCtr.mobileNumberTextEditingController,
                  keyboardType: TextInputType.number,
                  borderColor: Color(0xFF2F2F2F),
                  fillColor: Colors.transparent,
                  hintText: 'Enter Mobile No',
                  hintstyle: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (text) {
                    if (text.length == 10) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Email ID',
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                AppTextField(
                  validator: (value) {
                    return Validator.validateEmail(value!);
                  },
                  textController: pineLabCtr.emailIdTextEditingController,
                  borderColor: Color(0xFF2F2F2F),
                  fillColor: Colors.transparent,
                  hintText: 'Enter Email ID',
                  hintstyle: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Address',
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                AppTextField(
                  textController: pineLabCtr.addressTextEditingController,
                  borderColor: Color(0xFF2F2F2F),
                  fillColor: Colors.transparent,
                  hintText: 'Enter Address',
                  hintstyle: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: Color(0xFFB6B6B6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          AppTextField(
                            textController:
                                pineLabCtr.cityTextEditingController,
                            borderColor: Color(0xFF2F2F2F),
                            fillColor: Colors.transparent,
                            hintText: 'City',
                            hintstyle: TextStyle(
                              color: Color(0xFF363636),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.verticalSpace,
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'State',
                              style: TextStyle(
                                color: Color(0xFFB6B6B6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          AppTextField(
                            textController:
                                pineLabCtr.stateTextEditingController,
                            borderColor: Color(0xFF2F2F2F),
                            fillColor: Colors.transparent,
                            hintText: 'State',
                            hintstyle: TextStyle(
                              color: Color(0xFF363636),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Pin Code',
                    style: TextStyle(
                      color: Color(0xFFB6B6B6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                AppTextField(
                  textController: pineLabCtr.pinCodeTextEditingController,
                  borderColor: Color(0xFF2F2F2F),
                  fillColor: Colors.transparent,
                  hintText: 'Pincode',
                  hintstyle: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ///////////////<---------Service--------->///////////////////

  Future<void> minKycService() async {
    var pineLabCtr = ref.watch(pineLabController);
    await kycTokenGenerateService(context);
    PineLabMinKycModel? res = await PineLabKycRepo().pineLabMinKycRepo(
        pineLabCtr.fullNameTextEditingController.text,
        pineLabCtr.mobileNumberTextEditingController.text,
        pineLabCtr.emailIdTextEditingController.text,
        UserPreferences.userId);

    if (res?.success == true) {
      final webLink = res?.data!.webLink;
      if (webLink != null) {
        launchUrl(
            mode: LaunchMode.inAppWebView,
            Uri.parse(
              '${res?.data?.webLink}',
            ));
      } else {
        print('min kyc error');
      }
    } else {
      showToast(message: 'mobile number invalid');
      // CustomSnackbar.show(context: context, message: 'dddd', color: Colors.red);
      Navigator.pop(context);
    }
  }

  Future<void> fullKycService() async {
    var pineLabCtr = ref.watch(pineLabController);
    await kycTokenGenerateService(context);

    PineLabFullKycModel? res = await PineLabKycRepo().pineLabFullKycRepo(
        pineLabCtr.fullNameTextEditingController.text,
        pineLabCtr.mobileNumberTextEditingController.text,
        pineLabCtr.emailIdTextEditingController.text,
        UserPreferences.userId);

    if (res?.success == true) {
      if (res?.data!.kycLink?.mobileLink != null) {
        launchUrl(
            mode: LaunchMode.inAppWebView,
            Uri.parse(
              '${res?.data?.kycLink!.mobileLink}',
            ));
      } else {
        showToast(message: 'link not generated');
        print('full kyc error');
      }
    } else {
      showToast(message: 'mobile number invalid');
      // CustomSnackbar.show(context: context, message: 'dddd', color: Colors.red);
      Navigator.pop(context);
    }
  }

  Future<void> kycTokenGenerateService(BuildContext context) async {
    // _isLoading = true;

    PineLabKycTokenGenerateModel? res =
        await PineLabKycRepo().pineLabKycTokenGenerateRepo();

    if (res?.success == true) {
      // Navigator.pop(context);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => KycUserDetailsPage()));
    } else {
      if (kDebugMode) {
        print('somThing went wrong');
      }
    }
    // _isLoading = false;
  }
}
