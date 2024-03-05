import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/bottomNavigationBar_tabs/pofile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import '../widgets/mycontainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(
              'assets/images/refer.png',
              height: 27,
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
                              )
                              // CachedNetworkImage(
                              //   fadeInDuration: Duration(milliseconds: 100),
                              //   imageUrl: baseUrl + item.image.toString(),
                              //   fit: BoxFit.fill,
                              //   width: double.infinity,
                              //   errorWidget: (context, error, stackTrace) {
                              //     return Image.asset(
                              //       'assets/images/errorimages1.png',
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
                      scrollPhysics: BouncingScrollPhysics(),
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
                Text(
                  'Recharge & Bill Payments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.60,
                  ),
                ),
                MyContainer(
                  height: 34,
                  image: 'mobile2.png',
                ),
                Container(
                    alignment: Alignment.center,
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF3C3C3C)),
                        borderRadius: BorderRadius.circular(30)),
                    child: SvgPicture.asset(
                        'assets/images/bill-payments/vinod.svg')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
