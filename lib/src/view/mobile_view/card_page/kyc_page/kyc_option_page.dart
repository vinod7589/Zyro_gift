import 'package:abc/src/constants/height.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/controller/pinelab_kyc_controller.dart';
import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/radio_Button.dart';
import 'kyc_complete_page.dart';

class KycOptionPage extends ConsumerStatefulWidget {
  const KycOptionPage({super.key});

  @override
  ConsumerState<KycOptionPage> createState() => _KycOptionPageState();
}

class _KycOptionPageState extends ConsumerState<KycOptionPage> {
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
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.verticalSpace,
            Text(
              'KYC is essential for regulatory compliance, assuring a secure financial environment. safeguard your transactions by selecting your preferred level of verification for a seamless prepaid card experience.  ',
              style: TextStyle(
                color: const Color(0xFFA3A3A3),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            47.verticalSpace,
            Text(
              'Choose “MIN KYC” for Quick Process or\n“FULL KYC” for enhance Security',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            27.verticalSpace,
            Container(
              padding: EdgeInsets.only(top: 14, bottom: 30),
              decoration: ShapeDecoration(
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF303030)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Min KYC',
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RadioButtonWidget(
                          onTap: () {
                            pineLabCtr.changeMinKycChecked(true);
                          },
                          isTapped: pineLabCtr.minKycChecked,
                          inSideFillColor: Colors.grey,
                          outSideBorderColor: Colors.white,
                        )
                      ],
                    ),
                    8.verticalSpace,
                    Text(
                      'Don’t have a document now?\nClick to get started',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            30.verticalSpace,
            Container(
              padding: EdgeInsets.only(top: 14, bottom: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF303030)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full KYC',
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RadioButtonWidget(
                          onTap: () {
                            pineLabCtr.changeFullKycChecked(true);
                          },
                          isTapped: pineLabCtr.fullKycChecked,
                          inSideFillColor: Colors.grey,
                          outSideBorderColor: Colors.white,
                        )
                      ],
                    ),
                    8.verticalSpace,
                    Text(
                      'Upload correct documents and enjoy all the benefits of our products. KYC verification might take 2 to 3 working days.',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            AnimationButton(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KycCompletePage()));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => KycUserDetailsPage(
                //               isSelected: pineLabCtr.minKycChecked,
                //             )));
              },
              width: Height.ButtonWidth,
              title: 'Continue',
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
      ),
    );
  }
}
