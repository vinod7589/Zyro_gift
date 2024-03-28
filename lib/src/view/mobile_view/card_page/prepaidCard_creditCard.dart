import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/infrastructure/repository/pineLab_prepaidCard_repo.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/mobile_view/card_page/top_up_page.dart';
import 'package:abc/src/view/mobile_view/card_page/view_all_transaction_page.dart';
import 'package:abc/src/view/mobile_view/card_page/widget/card_shimmer_loading_page.dart';
import 'package:abc/src/view/mobile_view/card_page/widget/more_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/pineLab_prepaidCard_model/pineLab_prepaidCardTransaction_model.dart';

class PrepaidAndCreditCardPage extends StatefulWidget {
  const PrepaidAndCreditCardPage({Key? key}) : super(key: key);

  @override
  State<PrepaidAndCreditCardPage> createState() => _CardPageState();
}

class _CardPageState extends State<PrepaidAndCreditCardPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    isLoadingPage();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  isLoadingPage() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  List<String> tabs = [
    'Prepaid',
    'Credit',
  ];
  int current = 0;

  bool isLoading = false;

  List<TransactionDetailList> transactionList = [];

  // transactionFetch() async {
  //   PrepaidCardTransactionHistoryModel _res;
  //   _res = await PineLabPrepaidCardRepo()
  //       .prepaidCardTransactionService('2673933811', '');
  //   // transactionList = await PineLabPrepaidCardRepo().prepaidCardTransactionService( '2673933811', UserPreferences.userId)
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: isLoading
          ? CardShimmerLoadingPage()
          : Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      // snap: true,
                      leading: const SizedBox(),
                      leadingWidth: 0,
                      toolbarHeight: 100,
                      flexibleSpace: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 25, top: 10),
                                child: Image.asset(
                                  'assets/images/bill-payments/analytics.png',
                                  height: 21.h,
                                ),
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                height: 47.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFF262329),
                                ),
                                child: ListView.builder(
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                        tabController.animateTo(current);
                                      });
                                    },
                                    child: AnimatedContainer(
                                      transformAlignment: Alignment.center,
                                      curve: Curves.linearToEaseOut,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: Alignment.center,
                                      width: current == index ? 140 : 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: current == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                      child: Text(
                                        current == index
                                            ? '${tabs[index]} ' 'Card'
                                            : tabs[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: current == index
                                              ? Colors.black
                                              : Colors.white54,
                                          fontSize:
                                              current == index ? 15.sp : 15.sp,
                                          fontWeight: current == index
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 20.verticalSpace,
                        ],
                      ),
                    ),
                    SliverAppBar(
                      leadingWidth: 0,
                      leading: SizedBox(),
                      pinned: true,
                      toolbarHeight: 255,
                      flexibleSpace: Padding(
                        padding: pagePadding,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/bill-payments/cardimage.png',
                              height: 220,
                            ),
                            7.verticalSpace,
                            Padding(
                              padding: pagePadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/bill-payments/cvv.png',
                                          height: 17,
                                        ),
                                        8.horizontalSpace,
                                        Text(
                                          'CVV',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Issued by Pine labs',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.08,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₹ ' + '3,00,000',
                                      style: TextStyle(
                                        color: const Color(0xFF13C782),
                                        fontSize: 17.85.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.18,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Image.asset(
                                      'assets/images/bill-payments/retry.png',
                                      height: 18,
                                    )
                                  ],
                                ),
                                15.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 47.w,
                                            height: 47.h,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF3A363F),
                                                shape: BoxShape.circle),
                                            child: SvgPicture.asset(
                                              'assets/images/bill-payments/scan-pay.svg',
                                              height: 21,
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Scan & Pay',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.12,
                                            ),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: TopUpPage(),
                                                  type: PageTransitionType
                                                      .bottomToTop));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: 47.w,
                                              height: 47.h,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF3A363F),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                'assets/images/bill-payments/top-up.png',
                                                height: 21.h,
                                              ),
                                            ),
                                            8.verticalSpace,
                                            Text(
                                              'Top up',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 47.w,
                                            height: 47.h,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF3A363F),
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              'assets/images/bill-payments/add-card.png',
                                              height: 21.h,
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Add Card',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.12,
                                            ),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            elevation: 0,
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor:
                                                const Color(0xFF2C2C2C),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                              top: Radius.circular(30),
                                            )),
                                            builder: (context) =>
                                                StatefulBuilder(
                                                    builder: (context, f) {
                                              return const MoreOptionWidget();
                                            }),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: 47.w,
                                              height: 47.h,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF3A363F),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                'assets/images/bill-payments/more.png',
                                                height: 21.h,
                                              ),
                                            ),
                                            8.verticalSpace,
                                            Text(
                                              'More',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                25.verticalSpace,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 144,
                                        child: Text(
                                          'Recent Transaction',
                                          style: TextStyle(
                                            color: const Color(0xFFA9A9A9),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.28,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child:
                                                      const ViewAllTransactionPage(),
                                                  type: PageTransitionType
                                                      .leftToRight));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          alignment: Alignment.center,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF1F1F1F),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View all',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.20,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          12.verticalSpace,
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            physics: const PageScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          width: 60,
                                          height: 60,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF313131),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: 40,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF5F5F5F),
                                              shape: OvalBorder(),
                                            ),
                                            child: Text(
                                              'V',
                                              style: TextStyle(
                                                color: const Color(0xFFDFDFDF),
                                                fontSize: 19.60.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.20,
                                              ),
                                            ),
                                          )),
                                      13.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 180,
                                            child: Text(
                                              'vinod',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: const Color(0xFFDFDFDF),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.13,
                                              ),
                                            ),
                                          ),
                                          3.verticalSpace,
                                          Container(
                                            width: 180,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              'March 3, 2024 at 8:30 PM',
                                              style: TextStyle(
                                                color: const Color(0xFF565358),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '₹ ' '434.10',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const ViewAllTransactionPage(),
                                          type:
                                              PageTransitionType.leftToRight));
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(bottom: 10, top: 5),
                                  height: 30,
                                  width: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF1F1F1F),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'View all',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.20,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
