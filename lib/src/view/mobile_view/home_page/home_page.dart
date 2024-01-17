import 'dart:developer';
import 'dart:typed_data';

import 'package:abc/src/infrastructure/repository/homePage_repo/getAll_brand_list_repo.dart';
import 'package:abc/src/model/homePage/add_money_model.dart';
import 'package:abc/src/model/homePage/getAll_brand_list_model.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import 'widget/Home_globalPage.dart';
import 'home_items_page/myntra_card_page.dart';
import '../bottomNavigationBar_tabs/pofile_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  List<AllBrandList> allBrandList = [];
  Future<void> fetch() async {
    allBrandList = await HomePageService.getAllBrandList("") ?? [];

    setState(() {});
  }

  TextEditingController searchBarTextEditingController =
      TextEditingController();
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    var homePage = ref.watch(HomeGlobalPage);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            // snap: true,
            // floating: true,
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            titleSpacing: 5,
            toolbarHeight: 60.h,
            flexibleSpace: Column(
              children: [
                Row(
                  children: [
                    IconButton(
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
                    const Text(
                      'Zyro Gifts',
                      style: TextStyle(
                        fontSize: 24.14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.48,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverAppBar(
            toolbarHeight: 137.h,
            pinned: true,
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: constants.searchBarHeight,
                  color: const Color.fromRGBO(35, 35, 35, 1),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      controller: searchBarTextEditingController,
                      // isEnable = true;
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
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
                          suffixIcon: searchBarTextEditingController
                                  .text.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: IconButton(
                                      onPressed: () {
                                        // isEnable = true;
                                        searchBarTextEditingController.clear();

                                        FocusScope.of(context).unfocus();
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      )),
                                )
                              : null,
                          prefixIcon: Container(
                            padding: EdgeInsets.all(13),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 0),
                              child: Image.asset(
                                'assets/images/Search.png',
                              ),
                            ),
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
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Container(
                    height: 68.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 30,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homePage.allCategoriesList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              homePage.allCategoriesList[index].categoriesImage
                                  .toString(),
                              height: 40,
                            ),
                            10.verticalSpace,
                            Text(
                              homePage.allCategoriesList[index].title
                                  .toString(),
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 12.07.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                                letterSpacing: 0.06,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////<! Discount widget !>///////

                    // 18.verticalSpace,
                    // Row(
                    //   children: [
                    //     SvgPicture.asset('assets/images/Discount.svg'),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     const Text(
                    //       'save up to',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 14.61,
                    //         fontWeight: FontWeight.w500,
                    //         letterSpacing: 0.29,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // 10.verticalSpace,
                    // Container(
                    //   height: 33,
                    //   child: ListView.separated(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) => GestureDetector(
                    //             onTap: () {
                    //               _selectedIndex = index;
                    //               log(homePage.discount[_selectedIndex]);
                    //               setState(() {});
                    //             },
                    //             child: Container(
                    //               alignment: Alignment.center,
                    //               width: 70,
                    //               height: 33,
                    //               // padding: EdgeInsets.symmetric(
                    //               //     vertical: 8, horizontal: 15.w),
                    //               decoration: BoxDecoration(
                    //                   color: _selectedIndex == index
                    //                       ? Colors.white
                    //                       : Colors.transparent,
                    //                   border: Border.all(
                    //                     color: _selectedIndex == index
                    //                         ? Colors.black54
                    //                         : Colors.white,
                    //                   ),
                    //                   borderRadius: BorderRadius.circular(30)),
                    //               child: Text(
                    //                 homePage.discount[index],
                    //                 style: TextStyle(
                    //                   color: _selectedIndex == index
                    //                       ? Colors.black
                    //                       : Colors.white,
                    //                   fontSize: 13,
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.w500,
                    //                   letterSpacing: 0.06,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //       separatorBuilder: (context, index) => 10.horizontalSpace,
                    //       itemCount: homePage.discount.length),
                    // ),
                    // 20.verticalSpace,
                    const Text(
                      'Popular Brands',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.29,
                      ),
                    ),
                    15.5.verticalSpace,
                    Container(
                      height: 323.h,
                      child: GridView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing:
                                      10.0, // Spacing between columns
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.9 // Spacing between rows
                                  ),
                          itemCount: homePage.bannerGridList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < allBrandList.length) {
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
                                    builder: (context) => Consumer(
                                        builder: (context, ref, child) {
                                      var homePage = ref.watch(HomeGlobalPage);
                                      return SingleChildScrollView(
                                        // controller: scrollController,
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 1,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Divider(
                                                      color: Color(0xFFEFEFEF),
                                                      thickness: 2,
                                                    ),
                                            itemBuilder:
                                                (context, index) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 15),
                                                          width:
                                                              double.infinity,
                                                          height: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .deepPurple
                                                                      .shade800
                                                                      .withOpacity(
                                                                          0.1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border
                                                                      .all(
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.06,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      0.24,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    const TextSpan(
                                                                      text:
                                                                          ' ₹ ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            23.14,
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        letterSpacing:
                                                                            0.46,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          '${homePage.getTotalamount().toString().replaceAll(homePage.regex, '')}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            23.14,
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              10,
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            '. . . .',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            'Zyro Gifts',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 12.50,
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
                                                        15.verticalSpace,
                                                        ListView.separated(
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              AddMoney
                                                                  addMoney =
                                                                  homePage.amount[
                                                                      index];
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        30),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  //
                                                                  children: [
                                                                    Text(
                                                                      '₹ ' +
                                                                          addMoney
                                                                              .amountName
                                                                              .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            0.08,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        height:
                                                                            35,
                                                                        width:
                                                                            113,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7),
                                                                            border: Border.all(color: Colors.white)),
                                                                        child: Row(
                                                                          children: [
                                                                            IconButton(
                                                                                padding: const EdgeInsets.only(right: 0),
                                                                                onPressed: () {
                                                                                  homePage.decreaseNumber(double, index);
                                                                                },
                                                                                icon: const Icon(
                                                                                  Icons.remove,
                                                                                  color: Colors.white,
                                                                                )),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(right: 0),
                                                                              child: SizedBox(
                                                                                width: 15,
                                                                                child: Text(
                                                                                  addMoney.quantity.toString(),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(
                                                                                    color: addMoney.quantity > 0 ? const Color(0xFFAD62FF) : Colors.white,
                                                                                    fontSize: 16,
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w500,
                                                                                    letterSpacing: 0.27,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                                padding: const EdgeInsets.only(),
                                                                                onPressed: () {
                                                                                  homePage.increaseNumber(double, index);
                                                                                },
                                                                                icon: const Icon(
                                                                                  Icons.add,
                                                                                  color: Colors.white,
                                                                                )),
                                                                          ],
                                                                        ))
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            separatorBuilder:
                                                                (context,
                                                                        index) =>
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                            itemCount: homePage
                                                                .amount.length),
                                                        20.verticalSpace,
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
                                                                                const MyntraCardPAge()));
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 314,
                                                                height: 51,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: const BorderSide(
                                                                        width:
                                                                            1,
                                                                        color: Color(
                                                                            0xFF8C8C8C)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            66),
                                                                  ),
                                                                ),
                                                                child:
                                                                    const Text(
                                                                  'Proceed',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF2C2C2C),
                                                                    fontSize:
                                                                        16,
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
                                            const Color.fromRGBO(
                                                155, 234, 5, 1.0),
                                        homePage.bannerGridList[index].color2 ??
                                            const Color.fromRGBO(
                                                255, 0, 0, 0.2901960784313726),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 15, left: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              child: Image.asset(
                                                homePage.bannerGridList[index]
                                                        .companyImages ??
                                                    "",
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                            10.horizontalSpace,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 85,
                                                  child: Text(
                                                    // 'Kalyan Jewellers dqweqd',
                                                    allBrandList[index]
                                                        .brandName,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.19,
                                                      letterSpacing: 0.06,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      allBrandList[index]
                                                          .discount
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.95,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(17)),
                                            child: Image.asset(
                                              homePage.bannerGridList[index]
                                                      .productImages ??
                                                  "",
                                              height: 80.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                    14.verticalSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       alignment: Alignment.center,
                    //       decoration: ShapeDecoration(
                    //         shape: RoundedRectangleBorder(
                    //           side: const BorderSide(color: Color(0xFF919191)),
                    //           borderRadius: BorderRadius.circular(28.37),
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         'View all',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 14.68,
                    //           fontFamily: 'Inter',
                    //           fontWeight: FontWeight.w500,
                    //           letterSpacing: 0.07,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    /////<! Popular Brands 2!>/////
                    // 15.verticalSpace,
                    // const Text(
                    //   'Popular Brands',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 14.61,
                    //     fontWeight: FontWeight.w500,
                    //     letterSpacing: 0.29,
                    //   ),
                    // ),
                    // 14.verticalSpace,
                    // Container(
                    //   // color: Colors.red,
                    //   // height: 410,
                    //   child: GridView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2, // Number of columns
                    //             crossAxisSpacing:
                    //                 10.0, // Spacing between columns
                    //             mainAxisSpacing: 18.0,
                    //             childAspectRatio: 0.8 // Spacing between rows
                    //             ),
                    //     itemCount: homePage.redeemCode.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         height: 300,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(8),
                    //           color: homePage.redeemCode[index].color1,
                    //         ),
                    //         child: Column(
                    //           children: [
                    //             20.verticalSpace,
                    //             const Text(
                    //               'GET 4% OFF',
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //             12.verticalSpace,
                    //             Image.asset(
                    //               homePage.redeemCode[index].companyImages ??
                    //                   "",
                    //               height: 62,
                    //             ),
                    //             10.verticalSpace,
                    //             Text.rich(
                    //               TextSpan(
                    //                 children: [
                    //                   const TextSpan(
                    //                     text: 'Code : ',
                    //                     style: TextStyle(
                    //                       color: Color(0xFF6D6D6D),
                    //                       fontSize: 12,
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                   const TextSpan(
                    //                     text: ' ',
                    //                     style: TextStyle(
                    //                       color: Colors.black,
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w500,
                    //                     ),
                    //                   ),
                    //                   TextSpan(
                    //                     text: homePage.redeemCode[index].code ??
                    //                         "",
                    //                     style: const TextStyle(
                    //                       color: Colors.black,
                    //                       fontSize: 12,
                    //                       fontFamily: 'Poppins',
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             const Spacer(),
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Container(
                    //                     height: 40,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: const BorderRadius.only(
                    //                           bottomLeft: Radius.circular(8),
                    //                           bottomRight: Radius.circular(8)),
                    //                       color:
                    //                           homePage.redeemCode[index].color2,
                    //                     ),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         Text(
                    //                           homePage.redeemCode[index]
                    //                                   .title ??
                    //                               "",
                    //                           style: const TextStyle(
                    //                             color: Colors.white,
                    //                             fontSize: 14,
                    //                             fontFamily: 'Poppins',
                    //                             fontWeight: FontWeight.w500,
                    //                             height: 1.29,
                    //                           ),
                    //                         )
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // 10.verticalSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       alignment: Alignment.center,
                    //       decoration: ShapeDecoration(
                    //         shape: RoundedRectangleBorder(
                    //           side: const BorderSide(color: Color(0xFF919191)),
                    //           borderRadius: BorderRadius.circular(28.37),
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         'View all',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 14.68,
                    //           fontFamily: 'Inter',
                    //           fontWeight: FontWeight.w500,
                    //           letterSpacing: 0.07,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    15.verticalSpace,
                    Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 150,
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
                                height: 120.h,
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
                            top: 135.h,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: homePage.imageList
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                return GestureDetector(
                                  onTap: () => homePage.carouselController
                                      .animateToPage(entry.key),
                                  child: Container(
                                    width: homePage.currentIndex == entry.key
                                        ? 17
                                        : 5,
                                    height: 5.0,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            homePage.currentIndex == entry.key
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
                    10.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Top Trending',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.65,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 205,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors
                                      .transparent, // Set border color to transparent
                                ),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.01),
                                end: Alignment(-1, -0.01),
                                colors: [Color(0x00EDEDED), Color(0xFFE6E6E6)],
                              )),
                        )),
                      ],
                    ),
                    30.verticalSpace,
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.asset(
                                homePage.topTrending[index].brandImage
                                    .toString(),
                                height: 140.h,
                              ),
                              20.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homePage.topTrending[index].brandName
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.95.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.09,
                                    ),
                                  ),
                                  3.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        homePage.topTrending[index].type
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.06,
                                        ),
                                      ),
                                      Text(
                                        ' . Online',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.06,
                                        ),
                                      )
                                    ],
                                  ),
                                  9.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        homePage.topTrending[index].discount
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF00A91B),
                                          fontSize: 18.95,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.09,
                                        ),
                                      ),
                                      Text(
                                        '% off',
                                        style: TextStyle(
                                          color: Color(0xFF00A91B),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.06,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => 20.verticalSpace,
                        itemCount: 4),
                  ],
                ),
              ),
              40.verticalSpace,
              // 20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      // width: 300,
                      color: Colors.white,
                      height: 295.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              'Enjoy the trip, not the costs \ntravel wisely',
                              style: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 15.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          homePage.tripTravel[index].brandImage
                                              .toString(),
                                          height: 160.h,
                                        ),
                                        5.verticalSpace,
                                        SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Image.asset('assets/images/'),
                                              Text(
                                                homePage
                                                    .tripTravel[index].brandName
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    homePage.tripTravel[index]
                                                        .discount
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(0xFF00A91B),
                                                      fontSize: 16.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 0.08,
                                                    ),
                                                  ),
                                                  Text(
                                                    '% off',
                                                    style: TextStyle(
                                                      color: Color(0xFF00A91B),
                                                      fontSize: 12.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.06,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 0,
                                    ),
                                itemCount: 5),
                          ),
                        ],
                      )),
                  25.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ignite your entertainment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.80,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36,
                          ),
                        ),
                        3.verticalSpace,
                        Row(
                          children: [
                            Text(
                              'with hot deals',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.35,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.27,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.50,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors
                                          .transparent, // Set border color to transparent
                                    ),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(1.00, 0.01),
                                    end: Alignment(-1, -0.01),
                                    colors: [
                                      Color(0x00EDEDED),
                                      Color(0xFFE6E6E6)
                                    ],
                                  )),
                            )),
                          ],
                        ),
                        20.verticalSpace,
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Image.asset(
                                    homePage
                                        .entertainmentHotDeals[index].brandImage
                                        .toString(),
                                    height: 140.h,
                                  ),
                                  20.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homePage.entertainmentHotDeals[index]
                                            .brandName
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.95.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.09,
                                        ),
                                      ),
                                      3.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            homePage
                                                .entertainmentHotDeals[index]
                                                .type
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.06,
                                            ),
                                          ),
                                          Text(
                                            ' . Online',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.06,
                                            ),
                                          )
                                        ],
                                      ),
                                      9.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            homePage
                                                .entertainmentHotDeals[index]
                                                .discount
                                                .toString(),
                                            style: TextStyle(
                                              color: Color(0xFF00A91B),
                                              fontSize: 18.95,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.09,
                                            ),
                                          ),
                                          Text(
                                            '% off',
                                            style: TextStyle(
                                              color: Color(0xFF00A91B),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.06,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                20.verticalSpace,
                            itemCount: 4),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Image.asset('assets/images/referbanner.png'),
                  ),
                  20.verticalSpace
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
