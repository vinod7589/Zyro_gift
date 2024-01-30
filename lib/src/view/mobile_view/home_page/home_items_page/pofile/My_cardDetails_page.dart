import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/My_carddetails_model.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/about_toggle_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/howto_redeem_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/widget/terms_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardDetailsPage extends StatefulWidget {
  final String orderId;
  MyCardDetailsPage({super.key, required this.orderId});

  @override
  State<MyCardDetailsPage> createState() => _MyCardDetailsPageState();
}

class _MyCardDetailsPageState extends State<MyCardDetailsPage> {
  DrawerRepoService drawerRepo = DrawerRepoService();

  CardDetailsModel carddetails = CardDetailsModel();

  Future<void> cardDetailfetch() async {
    isLoading = true;
    var res = await drawerRepo.cardDetailsServive(widget.orderId);
    setState(() {
      carddetails = res;
    });
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    cardDetailfetch();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : carddetails.data == null
            ? SizedBox()
            : Scaffold(
                backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  titleSpacing: 2,
                  title: Text(
                    'Myntra card',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/images/myntra-m-logo.png'),
                                const Text(
                                  'Card worth',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.06,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                Container(
                                  width: 236,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF4A4A4A),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '8098678045678904',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                          letterSpacing: 0.08,
                                        ),
                                      ),
                                      15.horizontalSpace,
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                20.verticalSpace,
                                Container(
                                  alignment: Alignment.center,
                                  width: 236,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF4A4A4A),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: const Text(
                                    '7 5 8 9',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Container(
                          width: 334,
                          height: 88,
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
                                    'Purchased On : ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  Text(
                                    carddetails.data!.card![0].purchaseOn!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.24,
                                    ),
                                  )
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Valid Till :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  Text(
                                    carddetails.data!.card![0].expiryDate!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.24,
                                    ),
                                  )
                                ],
                              ),
                              10.verticalSpace,
                              const Row(
                                children: [
                                  Text(
                                    'Max Users :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  Text(
                                    'Jan 22, 2024 ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.06,
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
                        AboutThePageToggleWidget(brandCode: widget.orderId),
                        20.verticalSpace,
                        HowToRedeemWidget(brandCode: widget.orderId),
                        20.verticalSpace,
                        const TermsConditionWidget(),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
  }
}
