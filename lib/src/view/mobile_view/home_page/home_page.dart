import 'dart:developer';

import 'package:abc/src/view/mobile_view/home_page/widget/bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import 'widget/Home_globalPage.dart';
import 'home_items_page/myntra_card_page.dart';
import 'home_items_page/pofile_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var homePage = ref.watch(HomeGlobalPage);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const ProfilePage()));
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 34,
            )),
        actions: [],
        title: const Text(
          'Zyro Gifts',
          style: TextStyle(
            fontSize: 24.14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.48,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 140,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(homePage.currentIndex);
                  },
                  child: CarouselSlider(
                    items: homePage.imageList
                        .map(
                          (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        )
                        .toList(),
                    carouselController: homePage.carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      height: 110,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          homePage.currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: homePage.imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => homePage.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: homePage.currentIndex == entry.key ? 17 : 5,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: homePage.currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(),
                  child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          contentPadding: const EdgeInsets.only(
                            left: 2,
                            top: 8,
                            bottom: 8,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 8),
                            child: Image.asset('assets/images/Search.png'),
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xFFB5B5B5),
                            fontWeight: FontWeight.w400,
                            height: 1.29,
                          ),
                          hintText: "Search for Brands",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(color: Colors.white)))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/Discount.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'save up to',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.61,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.29,
                        ),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  height: 33,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              _selectedIndex = index;
                              log(homePage.discount[_selectedIndex]);
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 33,
                              // padding: EdgeInsets.symmetric(
                              //     vertical: 8, horizontal: 15.w),
                              decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: _selectedIndex == index
                                        ? Colors.black54
                                        : Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                homePage.discount[index],
                                style: TextStyle(
                                  color: _selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.06,
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => 10.horizontalSpace,
                      itemCount: homePage.discount.length),
                ),
                35.verticalSpace,
                const Text(
                  'Save your routine spends',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.29,
                  ),
                ),
                15.5.verticalSpace,
                Container(
                  // height: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 10.0, // Spacing between columns
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.1 // Spacing between rows
                            ),
                    itemCount: homePage.bannerGridList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(17),
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 0,
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: const Color(0xFF2C2C2C),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            )),
                            builder: (context) =>
                                Consumer(builder: (context, ref, child) {
                              var homePage = ref.watch(HomeGlobalPage);
                              return DraggableScrollableSheet(
                                  initialChildSize: 0.7,
                                  minChildSize: 0.5,
                                  maxChildSize: 0.7,
                                  // snapSizes: [0.4, 0.7],
                                  // snap: true,

                                  expand: false,
                                  builder: (context, scrollController) {
                                    return SingleChildScrollView(
                                      controller: scrollController,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 1,
                                          separatorBuilder: (context, index) =>
                                              const Divider(
                                                color: Color(0xFFEFEFEF),
                                                thickness: 2,
                                              ),
                                          itemBuilder: (context, index) =>
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      24.verticalSpace,
                                                      Container(
                                                        width: 76,
                                                        height: 5,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: const Color(
                                                              0xFF444444),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        91),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 15),
                                                    width: double.infinity,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .deepPurple.shade800
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFF494949),
                                                        )),
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 34,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/myntra-m-logo.png',
                                                          height: 20,
                                                        ),
                                                        14.verticalSpace,
                                                        const Text(
                                                          'Card worth',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.06,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.24,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        const Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: ' ₹ ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      23.14,
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  letterSpacing:
                                                                      0.46,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: '2500',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      23.14,
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      0.46,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      '. . . .',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                    Text(
                                                                      'Zyro Gifts',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.50,
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        letterSpacing:
                                                                            0.25,
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
                                                  15.verticalSpace,
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30),
                                                    child: Column(
                                                      children: [
                                                        bottomSheets(
                                                            price: "200"
                                                                .toString(),
                                                            addNumber:
                                                                homePage.number,
                                                            decreaseNumber: homePage
                                                                .decreaseNumber,
                                                            increaseNumber: homePage
                                                                .increaseNumber),
                                                        20.verticalSpace,
                                                        bottomSheets(
                                                            price: "500"
                                                                .toString(),
                                                            addNumber:
                                                                homePage.number,
                                                            decreaseNumber: homePage
                                                                .decreaseNumber,
                                                            increaseNumber: homePage
                                                                .increaseNumber),
                                                        20.verticalSpace,
                                                        bottomSheets(
                                                            price: "1,000"
                                                                .toString(),
                                                            addNumber: homePage
                                                                .number
                                                                .toInt(),
                                                            decreaseNumber: () {
                                                              homePage
                                                                  .decreaseNumber;
                                                              setState(() {});
                                                            },
                                                            increaseNumber: () {
                                                              homePage
                                                                  .increaseNumber;
                                                              setState(() {});
                                                            }),
                                                        20.verticalSpace,
                                                        bottomSheets(
                                                            price: "2,000"
                                                                .toString(),
                                                            addNumber: homePage
                                                                .number
                                                                .toInt(),
                                                            decreaseNumber: () {
                                                              homePage
                                                                  .decreaseNumber;
                                                              setState(() {});
                                                            },
                                                            increaseNumber: () {
                                                              homePage
                                                                  .increaseNumber;
                                                              setState(() {});
                                                            }),
                                                        20.verticalSpace,
                                                        bottomSheets(
                                                            price: "5,000"
                                                                .toString(),
                                                            addNumber: homePage
                                                                .number
                                                                .toInt(),
                                                            decreaseNumber: () {
                                                              homePage
                                                                  .decreaseNumber;
                                                              setState(() {});
                                                            },
                                                            increaseNumber: () {
                                                              homePage
                                                                  .increaseNumber;
                                                              setState(() {});
                                                            })
                                                      ],
                                                    ),
                                                  ),
                                                  10.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MyntraCardPAge()));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 314,
                                                          height: 51,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  width: 1,
                                                                  color: Color(
                                                                      0xFF8C8C8C)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          66),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Proceed',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF2C2C2C),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              letterSpacing:
                                                                  0.08,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  20.verticalSpace,
                                                ],
                                              )),
                                    );
                                  });
                            }),
                          );
                        },
                        child: Container(
                          // padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: LinearGradient(
                              colors: [
                                homePage.bannerGridList[index].color1 ??
                                    const Color.fromRGBO(167, 0, 0, 0.04),
                                homePage.bannerGridList[index].color2 ??
                                    const Color.fromRGBO(208, 75, 75, 0.29),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 13),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          homePage.bannerGridList[index]
                                                  .companyImages ??
                                              "",
                                          height: 54,
                                        )),
                                    21.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          homePage.bannerGridList[index]
                                                  .title ??
                                              "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            height: 1.19,
                                            letterSpacing: 0.06,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              homePage.bannerGridList[index]
                                                      .discount ??
                                                  "",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.95,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 1.19,
                                                letterSpacing: 0.09,
                                              ),
                                            ),
                                            const Text(
                                              '% off',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 1.19,
                                                letterSpacing: 0.06,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(17)),
                                    child: Image.asset(
                                      homePage.bannerGridList[index]
                                              .productImages ??
                                          "",
                                      height: 56,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                14.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF919191)),
                          borderRadius: BorderRadius.circular(28.37),
                        ),
                      ),
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.68,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.07,
                        ),
                      ),
                    ),
                  ],
                ),
                26.verticalSpace,
                const Text(
                  'Popular Brands',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.61,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.29,
                  ),
                ),
                14.verticalSpace,
                Container(
                  // color: Colors.red,
                  // height: 410,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 10.0, // Spacing between columns
                            mainAxisSpacing: 18.0,
                            childAspectRatio: 0.8 // Spacing between rows
                            ),
                    itemCount: homePage.redeemCode.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: homePage.redeemCode[index].color1,
                        ),
                        child: Column(
                          children: [
                            20.verticalSpace,
                            const Text(
                              'GET 4% OFF',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            12.verticalSpace,
                            Image.asset(
                              homePage.redeemCode[index].companyImages ?? "",
                              height: 62,
                            ),
                            10.verticalSpace,
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Code : ',
                                    style: TextStyle(
                                      color: Color(0xFF6D6D6D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: homePage.redeemCode[index].code ?? "",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      color: homePage.redeemCode[index].color2,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          homePage.redeemCode[index].title ??
                                              "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1.29,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF919191)),
                          borderRadius: BorderRadius.circular(28.37),
                        ),
                      ),
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.68,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.07,
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                ),
                14.verticalSpace,
                Container(
                  // height: 290,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 12.0, // Spacing between columns
                            mainAxisSpacing: 15.0,
                            childAspectRatio: 1.1 // Spacing between rows
                            ),
                    itemCount: homePage.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: homePage.categories[index].color1 ??
                              const Color.fromRGBO(245, 245, 245, 1),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 13),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        homePage.categories[index]
                                                .companyImages1 ??
                                            "",
                                        height: 50,
                                      )),
                                  12.horizontalSpace,
                                  Text(
                                    homePage.categories[index].title ?? "",
                                    style: const TextStyle(
                                      color: Color(0xFF232323),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 13, bottom: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.asset(
                                      homePage.categories[index]
                                              .companyImages2 ??
                                          "",
                                      height: 54,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(17)),
                                    child: Image.asset(
                                      homePage.categories[index]
                                              .productImages ??
                                          "",
                                      height: 54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 46,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Image.asset('assets/images/referbanner.png'),
          ),
          40.verticalSpace
        ]),
      ),
    );
  }
}
