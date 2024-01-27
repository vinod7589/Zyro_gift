import 'package:abc/src/controller/home_page_controller.dart';
import 'package:abc/src/infrastructure/repository/homePage_repo/home_page_repo.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/test_file.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/beauty_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/categories_list_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/entertainment_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/fashion_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/new_brands_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/popular_brands_widget.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/travel_tri%5Bp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import '../../../controller/fixed_card_controller.dart';
import '../../../model/homePage/getbrand_details_model.dart';
import '../bottomNavigationBar_tabs/pofile_page.dart';
import 'home_items_page/card_details_page.dart';
import 'widget/Home_globalPage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  // getBrandDetails(brandCode, ref) async {
  //   try {
  //     GetBrandDetailsList? brandDetails =
  //         await HomePageService.getBrandDetailsService(brandCode);
  //
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => CardDetailsPage(
  //                   brandCode: brandDetails!.brandName.toString(),
  //                 )));
  //   } catch (error) {
  //     // Handle any errors that occur during the service call
  //     print('Error: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var homePage = ref.watch(HomeGlobalPage);
    var homeControlle = ref.watch(HomePageController(''));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  setState(() {});
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: const ProfilePage()));
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.transparent,
                  size: 34,
                )),
            // snap: true,
            // floating: true,
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),

            // toolbarHeight: 60.h,
            flexibleSpace: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {});
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
                // Text(
                //   'Zyro Gift',
                //   style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 24,
                //       color: Colors.white),
                // )
              ],
            ),
          ),
          SliverAppBar(
            leading: Text(''),
            toolbarHeight: 138.h,
            pinned: true,
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: CategoriesListWidget(),
                ),
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
                    15.verticalSpace,
                    homeControlle.isLoading
                        ? Center(
                            child: LoadingAnimationWidget.stretchedDots(
                            color: Colors.deepPurpleAccent,
                            size: 50,
                          ))
                        : PopularBrandsWidget(''),
                    20.verticalSpace,
                    Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 150.h,
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

                    /////Top Trending brands//////

                    // Row(
                    //   children: [
                    //     Text(
                    //       'Top Trending',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15.sp,
                    //         fontFamily: 'Poppins',
                    //         fontWeight: FontWeight.w400,
                    //         letterSpacing: 1.65,
                    //       ),
                    //     ),
                    //     Expanded(
                    //         child: Container(
                    //       margin: const EdgeInsets.only(left: 10),
                    //       width: 205,
                    //       decoration: const ShapeDecoration(
                    //           shape: RoundedRectangleBorder(
                    //             side: BorderSide(
                    //               width: 0.50,
                    //               strokeAlign: BorderSide.strokeAlignCenter,
                    //               color: Colors
                    //                   .transparent, // Set border color to transparent
                    //             ),
                    //           ),
                    //           gradient: LinearGradient(
                    //             begin: Alignment(1.00, 0.01),
                    //             end: Alignment(-1, -0.01),
                    //             colors: [Color(0x00EDEDED), Color(0xFFE6E6E6)],
                    //           )),
                    //     )),
                    //   ],
                    // ),
                    // 30.verticalSpace,
                    // ListView.separated(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) {
                    //       return Row(
                    //         children: [
                    //           Image.asset(
                    //             homePage.topTrending[index].brandImage
                    //                 .toString(),
                    //             height: 140.h,
                    //           ),
                    //           20.horizontalSpace,
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 homePage.topTrending[index].brandName
                    //                     .toString(),
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 18.95.sp,
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.w600,
                    //                   letterSpacing: 0.09,
                    //                 ),
                    //               ),
                    //               3.verticalSpace,
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     homePage.topTrending[index].type
                    //                         .toString(),
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 13.sp,
                    //                       fontFamily: 'Poppins',
                    //                       fontWeight: FontWeight.w400,
                    //                       letterSpacing: 0.06,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     ' . Online',
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 13.sp,
                    //                       fontFamily: 'Poppins',
                    //                       fontWeight: FontWeight.w400,
                    //                       letterSpacing: 0.06,
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //               9.verticalSpace,
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     homePage.topTrending[index].discount
                    //                         .toString(),
                    //                     style: const TextStyle(
                    //                       color: Color(0xFF00A91B),
                    //                       fontSize: 18.95,
                    //                       fontFamily: 'Poppins',
                    //                       fontWeight: FontWeight.w600,
                    //                       letterSpacing: 0.09,
                    //                     ),
                    //                   ),
                    //                   const Text(
                    //                     '% off',
                    //                     style: TextStyle(
                    //                       color: Color(0xFF00A91B),
                    //                       fontSize: 12,
                    //                       fontFamily: 'Poppins',
                    //                       fontWeight: FontWeight.w400,
                    //                       letterSpacing: 0.06,
                    //                     ),
                    //                   )
                    //                 ],
                    //               )
                    //             ],
                    //           )
                    //         ],
                    //       );
                    //     },
                    //     separatorBuilder: (context, index) => 20.verticalSpace,
                    //     itemCount: 4),
                  ],
                ),
              ),
              20.verticalSpace,
              NewBrandsWidget(),
              TravelTripWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FashionWidget(),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 17.w),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'View all ',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 15.sp,
                  //           fontFamily: 'Poppins',
                  //           fontWeight: FontWeight.w500,
                  //           letterSpacing: -0.30,
                  //         ),
                  //       ),
                  //       5.horizontalSpace,
                  //       Container(
                  //         alignment: Alignment.center,
                  //         width: 22.w,
                  //         height: 22.h,
                  //         decoration: ShapeDecoration(
                  //           color: Color(0xFF76546B),
                  //           shape: OvalBorder(),
                  //         ),
                  //         child: Icon(
                  //           Icons.arrow_forward_ios,
                  //           color: Colors.white,
                  //           size: 13.h,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  BeautyWidget(),
                  EnterTainmentWidget(),
                  // 25.verticalSpace,

                  /////Easy Gifting//////
                  // 30.verticalSpace,
                  // Container(
                  //   height: 330,
                  //   color: Color(0xFF313131),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding:
                  //             EdgeInsets.only(left: 15.w, top: 15, bottom: 20),
                  //         child: Text(
                  //           'Easy gifting\nfor your loved ones',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 15.sp,
                  //             fontFamily: 'Poppins',
                  //             fontWeight: FontWeight.w400,
                  //             letterSpacing: -0.30,
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         height: 240,
                  //         child: ListView.separated(
                  //             scrollDirection: Axis.horizontal,
                  //             // physics: const NeverScrollableScrollPhysics(),
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return Padding(
                  //                 padding: EdgeInsets.only(left: 15.w),
                  //                 child: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     Image.asset(
                  //                       homePage.giftLoveList[index].image
                  //                           .toString(),
                  //                       height: 140.h,
                  //                     ),
                  //                     20.horizontalSpace,
                  //                     Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         5.verticalSpace,
                  //                         Text(
                  //                           homePage
                  //                               .giftLoveList[index].brandname
                  //                               .toString(),
                  //                           style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 18.95.sp,
                  //                             fontFamily: 'Poppins',
                  //                             fontWeight: FontWeight.w600,
                  //                             letterSpacing: 0.09,
                  //                           ),
                  //                         ),
                  //                         // 3.verticalSpace,
                  //                         3.verticalSpace,
                  //                         Row(
                  //                           children: [
                  //                             Text(
                  //                               homePage.beautyBudgetList[index]
                  //                                   .discount
                  //                                   .toString(),
                  //                               style: const TextStyle(
                  //                                 color: Color(0xFF00A91B),
                  //                                 fontSize: 18.95,
                  //                                 fontFamily: 'Poppins',
                  //                                 fontWeight: FontWeight.w600,
                  //                                 letterSpacing: 0.09,
                  //                               ),
                  //                             ),
                  //                             const Text(
                  //                               '% off',
                  //                               style: TextStyle(
                  //                                 color: Color(0xFF00A91B),
                  //                                 fontSize: 12,
                  //                                 fontFamily: 'Poppins',
                  //                                 fontWeight: FontWeight.w400,
                  //                                 letterSpacing: 0.06,
                  //                               ),
                  //                             )
                  //                           ],
                  //                         )
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //             separatorBuilder: (context, index) => SizedBox(),
                  //             itemCount: 4),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
