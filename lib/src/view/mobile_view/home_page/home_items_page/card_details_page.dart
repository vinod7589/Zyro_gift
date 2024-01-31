// ignore_for_file: use_build_context_synchronously

import 'package:abc/src/controller/home_page_controller.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/payment_option_page.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/about_toggle_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/howto_redeem_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/terms_condition_widget.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../controller/fixed_card_controller.dart';
import '../../../../infrastructure/repository/checkli_maxlit_repo.dart';
import '../../../../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../../../../model/homePage/getbrand_details_model.dart';
import '../../../../model/homePage/voucher_entity.dart';
import '../../../custom_keyboard/custom_keyboard.dart';
import '../widget/denomination_select_widget.dart';

class CardDetailsPage extends ConsumerStatefulWidget {
  const CardDetailsPage({required this.brandCode, required this.voucher});
  final String brandCode;
  final VoucherEntity voucher;

  @override
  ConsumerState<CardDetailsPage> createState() => _CardDetailsPageState();
}

class RangeModel {
  int start = 0;
  int end = 0;
}

class _CardDetailsPageState extends ConsumerState<CardDetailsPage> {
  CheckMaxLimitRepo checkRepo = CheckMaxLimitRepo();
  HomePageService homeRepo = HomePageService();
  int currentValue = 0;
  bool isLoading = false;
  //late GetBrandDetailsList? brandData;
  late VoucherEntity brandData;
  num? availableLimit = 0;

  @override
  void initState() {
    super.initState();
    brandData = widget.voucher;
    checkAvailableLimit();
    //getBrand();
  }

  checkAvailableLimit() async {
    var res = await checkRepo.getCheckLimitService(widget.brandCode);
    setState(() {
      availableLimit = res;
    });
  }

  RangeModel manageDenomition(denomination, range) {
    RangeModel currentRange = RangeModel();
    if (denomination != '') {
      List<String> parts = range.split('-');
      if (parts.length == 2) {
        currentRange.start = int.tryParse(parts[0].trim()) ?? 0;
        currentRange.end = int.tryParse(parts[1].trim()) ?? 0;
      }
    }
    return currentRange;
  }

  // getBrand() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var res = await homeRepo.getBrandDetailsService(widget.brandCode);
  //   setState(() {
  //     brandData = res;
  //     isLoading = false;
  //   });
  // }

  getBrandDetails(brandCode) async {
    try {
      // setState(() {
      //   isLoading = true;
      // });
      //var fixedCardProvider = ref.watch(fixedCardController(brandCode));
      var homePageController = ref.watch(HomePageController(brandCode));
      // GetBrandDetailsList? brandDetails =
      //     await homeRepo.getBrandDetailsService(brandCode);
      // setState(() {
      //   isLoading = false;
      // });

      if (brandData!.brandType == 'Variable') {
        var res = manageDenomition(
            brandData?.denominationList, brandData?.denominationList);
        homePageController.numKeyboardTextEditingController.text =
            '₹ ${res.start.toString()}';
        setState(() {
          currentValue = res.start;
        });
        showModalBottomSheet(
          elevation: 0,
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color(0xFF2C2C2C),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          )),
          builder: (context) => Consumer(builder: (context, ref, child) {
            return SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  separatorBuilder: (context, index) => const Divider(
                        color: Color(0xFFEFEFEF),
                        thickness: 2,
                      ),
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              24.verticalSpace,
                              Container(
                                width: 76,
                                height: 5,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF444444),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(91),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            width: double.infinity,
                            height: 210.h,
                            decoration: BoxDecoration(
                                color:
                                    Colors.deepPurple.shade800.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFF494949),
                                )),
                            child: Column(
                              children: [
                                28.verticalSpace,
                                brandData.image != null
                                    ? Image.network(
                                        "$baseUrl${brandData.image.toString()}",
                                        height: 40.h,
                                      )
                                    : SizedBox(),
                                14.verticalSpace,
                                const Text(
                                  'Card worth',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.06,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  // color:
                                  //     Colors.red,
                                  width: 140.w,
                                  height: 36.h,
                                  child: Row(
                                    children: [
                                      // Text('₹ '),
                                      Expanded(
                                        child: TextFormField(
                                          controller: homePageController
                                              .numKeyboardTextEditingController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(6),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          onTapOutside: (e) =>
                                              FocusScope.of(context).unfocus(),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.none,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                          decoration: const InputDecoration(
                                              // prefixIcon: Icon(
                                              //   Icons.currency_rupee,
                                              //   color: Colors.white,
                                              // ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 0, top: 1, bottom: 7),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              hintText: '0'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '. . . .',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              'Zyro Gifts',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.50.sp,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                          15.verticalSpace,
                          NumericKeypad(
                            startValue: res.start,
                            endValue: res.end,
                            controller: homePageController
                                .numKeyboardTextEditingController,
                            availableLimit: availableLimit!,
                            brandCode: widget.brandCode,
                            discount: brandData.discount as num,
                          ),
                          20.verticalSpace,
                          20.verticalSpace,
                        ],
                      )),
            );
          }),
        );
      } else if (brandData!.brandType == 'Fixed') {
        showModalBottomSheet(
          elevation: 0,
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color(0xFF2C2C2C),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          )),
          builder: (context) => Consumer(builder: (context, ref, child) {
            return StatefulBuilder(builder: (context, f) {
              return Denomination(
                brandCode,
                brandData.discount as num,
                availableLimit: availableLimit!,
                voucher: brandData,
              );
            });
          }),
        );
      }
    } catch (error) {
      // Handle any errors that occur during the service call
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var cardDetailsController = ref.watch(HomePageController(widget.brandCode));
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 50,
            ),
          )
        : Scaffold(
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(
                  bottom: 25, top: 15, left: 20, right: 20),
              height: 51,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    if (brandData!.brandType != '') {
                      var res = getBrandDetails(widget.brandCode);
                      // var res = cardDetailsController.getBrandDetails();
                      print("'variable and fix type' $res");
                    }
                  },
                  child: Text(
                    brandData!.brandType == ''
                        ? 'Coming Soon'
                        : 'Get This Card',
                    style: const TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.11,
                      letterSpacing: 0.08,
                    ),
                  )),
            ),
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            appBar: AppBar(
              scrolledUnderElevation: 0,
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
                brandData!.brand.toString() ?? 'Demo',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.11,
                  letterSpacing: 0.08,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: double.infinity,
                    height: 184,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade800.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF494949),
                        )),
                    child: Column(
                      children: [
                        28.verticalSpace,
                        Image.network(
                          '$baseUrl${brandData?.image.toString()}',
                          height: 40,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/noimage.png',
                              height: 40,
                            );
                          },
                        ),
                        14.verticalSpace,
                        const Text(
                          'Card worth',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.06,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          'Get ' +
                              (brandData.discount ?? 0).toString() +
                              '% off',
                          style: const TextStyle(
                            color: Color(0xFFAC61FF),
                            fontSize: 21.14,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '. . . . . .',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      brandData?.redemptionProcess.toString() ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.50,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            showToast(message: 'No Coupon Found');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const ApplyCouponPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            height: 48,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xFF878787)),
                                borderRadius: BorderRadius.circular(34),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Ticket.png',
                                        height: 18,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      const Text(
                                        'Apply Coupon Code',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.29,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/rightarrow.png',
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        AboutThePageToggleWidget(
                            brandData: brandData.descriptions ?? ""),
                        20.verticalSpace,
                        HowToRedeemWidget(
                            brandData: brandData.redeemSteps ?? ""),
                        20.verticalSpace,
                        TermsConditionWidget(brandData: brandData.tnc ?? ""),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
