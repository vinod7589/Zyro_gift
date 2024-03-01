import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/My_carddetails_model.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/about_toggle_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/howto_redeem_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/terms_condition_widget.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../../constants/base_url.dart';
import '../../../../../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../../../../../model/homePage/getbrand_details_model.dart';
import '../../../Time_remove_widget.dart';

class MyCardDetailsPage extends ConsumerStatefulWidget {
  final String orderId;
  final num totalCardworth;

  MyCardDetailsPage(
      {super.key, required this.orderId, required this.totalCardworth});

  @override
  ConsumerState<MyCardDetailsPage> createState() => _MyCardDetailsPageState();
}

class _MyCardDetailsPageState extends ConsumerState<MyCardDetailsPage> {
  DrawerRepoService drawerRepo = DrawerRepoService();
  HomePageService homeRepo = HomePageService();
  bool isLoading = true;
  CardDetailsModel carddetails = CardDetailsModel();

  Future<void> cardDetailfetch() async {
    isLoading = true;
    var res = await drawerRepo.cardDetailsServive(widget.orderId);

    var brand =
        await homeRepo.getBrandDetailsService(res.data!.card![0].brandCode!);
    setState(() {
      carddetails = res;
      brandData = brand;
      isLoading = false;
    });
  }

  late GetBrandDetailsList? brandData; //= GetBrandDetailsList();

  @override
  void initState() {
    super.initState();
    cardDetailfetch();
  }

  DateTime purchaseOn(String dateTimeString) {
    return DateFormat("M/d/yyyy h:mm:ss a")
        .parse(carddetails.data!.card![0].purchaseOn!);
  }

  DateTime validTill(String dateTimeString) {
    return DateFormat("M/d/yyyy h:mm:ss a")
        .parse(carddetails.data!.card![0].expiryDate!);
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    showToast(message: 'Copied');
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 50,
            ),
          )
        : carddetails.data == null
            ? SizedBox()
            : Scaffold(
                backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  titleSpacing: 2,
                  title: Text(
                    carddetails.data!.card![0].brandName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  "$baseUrl${carddetails.data!.card![0].brandImage}" ??
                                      "",
                                  height: 50.h,
                                ),
                                15.verticalSpace,
                                Row(
                                  children: [
                                    Text(
                                      'Card worth',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      "₹ ${widget.totalCardworth.toString()}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                Container(
                                  width: 236.w,
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF4A4A4A),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        carddetails.data!.card![0].cardNo!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                          letterSpacing: 0.08,
                                        ),
                                      ),
                                      // 15.horizontalSpace,
                                      IconButton(
                                          alignment: Alignment.bottomRight,
                                          onPressed: () {
                                            _copyToClipboard(carddetails
                                                .data!.card![0].cardNo!);
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            color: Colors.white54,
                                            size: 21,
                                          ))
                                    ],
                                  ),
                                ),
                                8.verticalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  width: 236.w,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF4A4A4A),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Text(
                                    carddetails.data!.card![0].cardPin
                                        .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, top: 12, bottom: 12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF2D2D2D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Purchased On :  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.06.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  DateTimeFormatter(
                                      dateTime: purchaseOn(carddetails
                                          .data!.card![0].purchaseOn!)),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Valid Till :  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.06.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  DateTimeFormatter(
                                      dateTime: validTill(carddetails
                                          .data!.card![0].purchaseOn!)),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Max Users :  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.06.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  Text(
                                    '1 Claim per user',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.06.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.24,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        AboutThePageToggleWidget(
                            brandData: brandData!.descriptions!),
                        20.verticalSpace,
                        HowToRedeemWidget(brandData: brandData!.redeemSteps!),
                        20.verticalSpace,
                        TermsConditionWidget(brandData: brandData!.tnc),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
  }
}