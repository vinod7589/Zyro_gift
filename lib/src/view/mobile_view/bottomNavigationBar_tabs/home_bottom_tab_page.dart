import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/home_page/drawer/pofile_page.dart';
import 'package:abc/src/view/widgets/Navigator_push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import '../home_page/recharge_bill_payment_view_all_page.dart';
import '../widgets/mycontainer.dart';

class HomeBottomTabPage extends StatefulWidget {
  const HomeBottomTabPage({super.key});

  @override
  State<HomeBottomTabPage> createState() => _HomeBottomTabPageState();
}

class _HomeBottomTabPageState extends State<HomeBottomTabPage> {
  int currentIndex = 0;

  /// <------------------ <-controller->------------------->
  final CarouselController carouselController = CarouselController();

  /// <------------------ <-list->------------------->
  List bannerList = ['assets/images/banner.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const ProfilePage()));
              },
              child: Image.asset(
                'assets/images/menu.png',
                height: 34,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(
              'assets/images/refer.png',
              height: 27,
              width: 75,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          SizedBox(
            height: 188.h,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: CarouselSlider(
                    items: bannerList
                        .map(
                          (item) => InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/banner.png',
                                height: 34,
                              )
                              // CachedNetworkImage(
                              //   fadeInDuration: Duration(milliseconds: 100),
                              //   imageUrl: baseUrl + item.image.toString(),
                              //   fit: BoxFit.fill,
                              //   width: double.infinity,
                              //   errorWidget: (context, error, stackTrace) {
                              //     return Image.asset(
                              //       'assets/images/errorimages1.png',
                              // height: 34,
                              //     );
                              //   },
                              // ),
                              ),

                          //     Image.network(
                          //   baseUrl + item.image.toString(),
                          //   fit: BoxFit.fill,
                          //   width: double.infinity,
                          // ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      height: 170.h,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 160.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerList
                        .asMap()
                        .entries
                        .map(
                          (entry) => InkWell(
                            borderRadius: BorderRadius.circular(17),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 5,
                              height: 5.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.transparent
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recharge & Bill Payments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.60,
                  ),
                ),
                18.verticalSpace,
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyContainer(
                      image: 'mobile-recharge.png',
                      height: 34,
                      title: 'Mobile\nRecharge',
                    ),
                    MyContainer(
                      image: 'dth.png',
                      height: 31,
                      title: 'DTH',
                    ),
                    MyContainer(
                      image: 'electricity-bill.png',
                      height: 37,
                      title: 'Electricity',
                    ),
                    MyContainer(
                      image: 'fastTag.png',
                      height: 31,
                      title: 'FASTag\nRecharge',
                    ),
                  ],
                ),
                18.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyContainer(
                      image: 'rent-payment.png',
                      height: 28,
                      title: 'Rent\nPayment ',
                    ),
                    MyContainer(
                      image: 'water.png',
                      height: 34,
                      title: 'Water',
                    ),
                    MyContainer(
                      image: 'cylinder.png',
                      height: 34,
                      title: 'Book a\nCylinder',
                    ),
                    NavigatorPush(
                      title: RechargeBillPaymentViewAllPage(),
                      child: MyContainer(
                        image: 'view-more.png',
                        height: 26,
                        title: 'View \nmore',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
