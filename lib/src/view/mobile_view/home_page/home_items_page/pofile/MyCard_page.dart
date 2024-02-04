import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/My_cardDetails_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../../Packages/page_transition/enum.dart';
import '../../../../../Packages/page_transition/page_transition.dart';
import '../../../../../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../../../../../controller/internet_check_status_controller.dart';

class MyCardPage extends StatefulWidget {
  final bool isfrombottom;

  const MyCardPage({
    super.key,
    // required bool Isfrombottom,
    required this.isfrombottom,
  });

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  HomePageService homeRepo = HomePageService();
  DrawerRepoService drawerRepo = DrawerRepoService();

  // late GetBrandDetailsList? brandData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  List<MyCardList> myCardListItems = [];

  Future<void> fetch() async {
    isLoading = true;
    myCardListItems = await drawerRepo.myCard(
          "",
        ) ??
        [];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            appBar: AppBar(
                scrolledUnderElevation: 0,
                titleSpacing: 5,
                leadingWidth: widget.isfrombottom == false ? 50.w : 20.w,
                leading: widget.isfrombottom == false
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(),
                backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                title: Text(
                  'My Cards',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                  ),
                )),
            body: isLoading
                ? Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.white,
                      size: 50,
                    ),
                  )
                : (myCardListItems.isEmpty)
                    ? Center(
                        child: Text(
                          'No Cards found.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index < myCardListItems.length) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: MyCardDetailsPage(
                                          orderId: myCardListItems[index]
                                              .orderId
                                              .toString(),
                                          totalCardworth: myCardListItems[index]
                                              .totalVoucherAmount!,
                                        ),
                                        type: PageTransitionType.theme));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                width: double.infinity,
                                height: 200.h,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade800
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: const Color(0xFF494949),
                                    )),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 34,
                                    ),
                                    // Image.network(
                                    //   baseUrl +
                                    //       myCardListItems[index].brandImage.toString(),
                                    //   height: 40,
                                    // ),
                                    Image.network(
                                      baseUrl +
                                          myCardListItems[index]
                                              .brandImage
                                              .toString(),
                                      height: 40,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/images/others.png',
                                            height: 40);
                                      },
                                    ),
                                    14.verticalSpace,
                                    Text(
                                      myCardListItems[index]
                                          .brandName
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '₹' +
                                          myCardListItems[index]
                                              .totalVoucherAmount
                                              .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 23.14,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.46,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10,
                                                left: 20,
                                                right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Valid Till : ${myCardListItems[index].expiryOn.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.50.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  'Zyro Pay',
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return null;
                        },
                        itemCount: myCardListItems.length + 1,
                      ),
          );
        });
  }
}
