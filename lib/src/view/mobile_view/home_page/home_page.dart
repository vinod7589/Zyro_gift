import 'package:abc/src/infrastructure/repository/homePage_repo/home_page_repo.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import '../../../controller/search_page_pagination_controller.dart';
import '../../../infrastructure/repository/homePage_repo/getAllPopularBrandsModel.dart';
import '../../../model/auth/get_user_detail_model.dart';
import '../../../model/homePage/amazing_fashion_model.dart';
import '../../../model/homePage/beauty_budget_model.dart';
import '../../../model/homePage/entertainment_model.dart';
import '../../../model/homePage/getall_categories_model.dart';
import '../../../model/homePage/new_brands_model.dart';
import '../../../model/homePage/tripTravel_Model.dart';
import '../../../model/homePage/voucher_entity.dart';
import '../bottomNavigationBar_tabs/pofile_page.dart';
import '../searchPage/search_mobile_page.dart';
import 'home_items_page/card_details_page.dart';
import 'widget/Home_globalPage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  HomePageService homeRepo = HomePageService();

  @override
  void initState() {
    // getPopularBrands();
    // NewBrand();
    // travelTrip();
    // fashion();
    // beauty();
    // entertainment();
    getAllVouchers();
    // allCategories();
    super.initState();
  }

  List<VoucherEntity> allPopularBrands = [];
  List<VoucherEntity> categoriesList = [];
  List<VoucherEntity> tripTravelList = [];
  List<VoucherEntity> newBrandList = [];
  List<VoucherEntity> fashionList = [];
  List<VoucherEntity> beautyList = [];
  List<VoucherEntity> entertainmentList = [];

  // Future<void> allCategories() async {
  //   categoriesList = await homeRepo.getAllCategoriesService() ?? [];
  // }
  //
  // Future<void> travelTrip() async {
  //   tripTravelList = await homeRepo.travelTripService() ?? [];
  // }
  //
  // Future<void> NewBrand() async {
  //   newBrandList = await homeRepo.newBrandListService("") ?? [];
  // }
  //
  // Future<void> fashion() async {
  //   fashionList = await homeRepo.fashionService() ?? [];
  // }
  //
  // Future<void> beauty() async {
  //   beautyList = await homeRepo.beautyService() ?? [];
  // }
  //
  // Future<void> entertainment() async {
  //   entertainmentList = await homeRepo.entertainmentService() ?? [];
  // }

  // Future<void> getPopularBrands() async {
  //   isLoading = true;
  //   allPopularBrands = await homeRepo.getAllPopularBrandsService() ?? [];
  //   isLoading = false;
  // }

  bool isLoading = true;

  Future<void> getAllVouchers() async {
    setState(() {
      isLoading = true;
    });
    var res = await homeRepo.getAllVoucher();
    if (res.status == "success") {
      allPopularBrands =
          res.data!.where((item) => item.isPopularBrand == true).toList();
      newBrandList =
          res.data!.where((item) => item.isNewBrand == true).toList();
      tripTravelList =
          res.data!.where((item) => item.categoryId == 7).take(4).toList();

      fashionList =
          res.data!.where((item) => item.categoryId == 5).take(7).toList();
      beautyList =
          res.data!.where((item) => item.categoryId == 12).take(7).toList();
      entertainmentList =
          res.data!.where((item) => item.categoryId == 8).take(4).toList();
    }
    setState(() {
      isLoading = false;
    });
  }

  //////////TextEditingController////////////////
  TextEditingController searchBarTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var filteredBrandPaginationProvider =
        ref.watch(searchPagePaginationProvider);

    var homePage = ref.watch(HomeGlobalPage);
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
          // SliverAppBar(
          //   leading: SizedBox(),
          //   leadingWidth: 0,
          //   toolbarHeight: 124.h,
          //   pinned: true,
          //   scrolledUnderElevation: 0,
          //   backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
          //   flexibleSpace: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //
          //       15.verticalSpace,
          //       Padding(
          //         padding: EdgeInsets.only(left: 0),
          //         child: SizedBox(
          //           height: 55.h,
          //           child: ListView.separated(
          //             separatorBuilder: (context, index) => const SizedBox(
          //               width: 0,
          //             ),
          //             shrinkWrap: true,
          //             scrollDirection: Axis.horizontal,
          //             itemCount:
          //                 filteredBrandPaginationProvider.categoriesList.length,
          //             itemBuilder: (context, index) {
          //               return GestureDetector(
          //                 onTap: () {
          //                   filteredBrandPaginationProvider
          //                       .selectCategory(index);
          //                   Navigator.of(context).push(MaterialPageRoute(
          //                       builder: (c) => SearchMobilePage()));
          //                 },
          //                 child: Container(
          //                   width: 90,
          //                   height: 80,
          //                   // color: filteredBrandPaginationProvider.selectedIndex==index?Colors.purple.withOpacity(0.2):Colors.transparent,
          //                   child: Column(
          //                     children: [
          //                       CachedNetworkImage(
          //                         fadeInDuration: Duration(milliseconds: 100),
          //                         imageUrl:
          //                             '$baseUrl${filteredBrandPaginationProvider.categoriesList[index].categoryImage}',
          //                         height: 30,
          //                       ),
          //                       // Image.network(
          //                       //   '$baseUrl${filteredBrandPaginationProvider.categoriesList[index].categoryImage}',
          //                       //   height: 30.h,
          //                       //   errorBuilder: (context, error, stackTrace) {
          //                       //     return Image.asset(
          //                       //       'assets/images/noimage.png',
          //                       //       height: 30.h,
          //                       //     );
          //                       //   },
          //                       // ),
          //                       10.verticalSpace,
          //                       Text(
          //                         filteredBrandPaginationProvider
          //                             .categoriesList[index].categoryName
          //                             .toString()
          //                             .split(" ")
          //                             .first,
          //                         style: TextStyle(
          //                           color: const Color(0xFFFAFAFA),
          //                           fontSize: 12.07.sp,
          //                           fontWeight: FontWeight.w500,
          //                           height: 0.09,
          //                           letterSpacing: 0.06,
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //       5.verticalSpace,
          //       Container(
          //         height: 0.0,
          //         decoration:
          //             BoxDecoration(color: Colors.grey.shade700, boxShadow: [
          //           BoxShadow(
          //               color: Colors.grey.shade700,
          //               blurRadius: 0.5,
          //               offset: Offset(0, 1),
          //               spreadRadius: 0.3)
          //         ]),
          //       )
          //     ],
          //   ),
          // ),
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
            pinned: true,
            flexibleSpace: InkWell(
              borderRadius: BorderRadius.circular(17),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => SearchMobilePage())),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 47.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Search.png',
                      ),
                      20.horizontalSpace,
                      Text(
                        'Search for Brands or category',
                        style: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 13.42,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBarDelegate(
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(35, 35, 35, 1),
                      height: 55.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredBrandPaginationProvider
                            .categoriesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              filteredBrandPaginationProvider
                                  .selectCategory(index);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => SearchMobilePage()));
                            },
                            child: Container(
                              width: 90,
                              height: 80,
                              // color: filteredBrandPaginationProvider.selectedIndex==index?Colors.purple.withOpacity(0.2):Colors.transparent,
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 100),
                                    imageUrl:
                                        '$baseUrl${filteredBrandPaginationProvider.categoriesList[index].categoryImage}',
                                    height: 30,
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    filteredBrandPaginationProvider
                                        .categoriesList[index].categoryName
                                        .toString()
                                        .split(" ")
                                        .first,
                                    style: TextStyle(
                                      color: const Color(0xFFFAFAFA),
                                      fontSize: 12.07.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                      letterSpacing: 0.06,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Add more Slivers if needed
          // Add more Slivers if needed

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
                    Container(
                      height: 340,
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.9 // Spacing between rows
                                  ),
                          itemCount: allPopularBrands.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < allPopularBrands.length) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(17),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  isLoading;
                                  String brand = allPopularBrands[index]
                                      .brandCode
                                      .toString();

                                  if (brand != null && brand != '') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardDetailsPage(
                                                  brandCode: brand,
                                                  voucher:
                                                      allPopularBrands[index],
                                                )));
                                  }
                                  isLoading = false;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Column(
                                    children: [
                                      // CachedNetworkImage(
                                      //     imageUrl: baseUrl +
                                      //         allPopularBrands[index]
                                      //             .popularBrandImage!,),
                                      Stack(children: [
                                        // SvgPicture.network(
                                        //   'assets/images/swiggy test.svg',
                                        //   placeholderBuilder: (context) =>
                                        //       CircularProgressIndicator(),
                                        // ),
                                        CachedNetworkImage(
                                          // fadeInDuration:
                                          //     Duration(milliseconds: 100),
                                          imageUrl: baseUrl +
                                              allPopularBrands[index]
                                                  .popularBrandImage!,
                                        ),
//                                               Image.network(
//                                                 baseUrl +
//                                                     allPopularBrands[index]
//                                                         .popularBrandImage!,
// // height: 145.h,
//                                               ),
                                        Positioned(
                                          top: 20,
                                          child: Container(
// color: Colors.red,
                                            width: 165,
// height: 60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        child: Text(
                                                          maxLines: 1,
                                                          allPopularBrands[
                                                                  index]
                                                              .brand!,
                                                          style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .visible,
                                                            color: const Color(
                                                                0xFFF5F5F5),
                                                            fontSize: 13.49.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.06,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 80,
                                                          child: RichText(
                                                            text: TextSpan(
                                                              text: allPopularBrands[
                                                                      index]
                                                                  .discount
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: const Color(
                                                                    0xFFF5F5F5),
                                                                fontSize:
                                                                    17.49.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.06,
                                                              ),
                                                              children: const [
                                                                TextSpan(
                                                                  text:
                                                                      ' % off',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFFEFEFE),
                                                                    fontSize:
                                                                        12.49,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    letterSpacing:
                                                                        0.06,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
// Positioned(child: )
                                      ])
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                    20.verticalSpace,
                    Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 150.h,
                      child: Stack(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(17),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
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
                                return InkWell(
                                  borderRadius: BorderRadius.circular(17),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
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
              Container(
                color: const Color(0xFF313131),
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20),
                      child: Text(
                        'New Brands',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.61.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.29,
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    isLoading
                        ? Center(
                            child: LoadingAnimationWidget.stretchedDots(
                            color: Colors.deepPurpleAccent,
                            size: 50,
                          ))
                        : Container(
                            height: 200,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (index < newBrandList.length) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: InkWell(
                                        onTap: () {
                                          String brandCode = newBrandList[index]
                                              .brandCode
                                              .toString();
                                          if (brandCode != null &&
                                              brandCode != '') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CardDetailsPage(
                                                          brandCode: brandCode,
                                                          voucher: newBrandList[
                                                              index],
                                                        )));
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 100),
                                              imageUrl: baseUrl +
                                                  newBrandList[index]
                                                      .newBrandImage
                                                      .toString(),
                                            ),
                                            // SizedBox(
                                            //   child: Image.network(baseUrl +
                                            //       newBrandList[index]
                                            //           .newBrandImage
                                            //           .toString()),
                                            // ),
                                            Positioned(
                                              top: 30, // left: 20,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 48),
                                                    width: 140,
                                                    height: 40,
                                                    // color: Colors.red,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Get${newBrandList[index].discount}% OFF',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemCount: newBrandList.length),
                          ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  // width: 300,
                  color: Colors.white.withOpacity(0.9),
                  height: 300.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 15),
                        child: Text(
                          'Enjoy the trip, not the costs \ntravel wisely',
                          style: TextStyle(
                            color: const Color(0xFF232323),
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // if (index < tripTravelList.length)
                              return Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: InkWell(
                                  onTap: () {
                                    String brandCode = tripTravelList[index]
                                        .brandCode
                                        .toString();
                                    if (brandCode != null && brandCode != '') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CardDetailsPage(
                                                    brandCode: brandCode,
                                                    voucher:
                                                        tripTravelList[index],
                                                  )));
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 100),
                                        imageUrl: baseUrl +
                                            tripTravelList[index]
                                                .additionalImage
                                                .toString(),
                                        height: 160.h,
                                      ),
                                      // Image.network(
                                      //   baseUrl +
                                      //       tripTravelList[index]
                                      //           .additionalImage
                                      //           .toString(),
                                      //   height: 160.h,
                                      // ),
                                      5.verticalSpace,
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Image.asset('assets/images/'),
                                            Text(
                                              tripTravelList[index]
                                                  .brand
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
                                                  tripTravelList[index]
                                                      .discount
                                                      .toString(),
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF00A91B),
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.08,
                                                  ),
                                                ),
                                                Text(
                                                  '% off',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF00A91B),
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
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
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 0,
                                ),
                            itemCount: tripTravelList.length),
                      ),
                    ],
                  )),
              27.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Amazing Fashion',
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
                            const Text(
                              'Discount',
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
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const ShapeDecoration(
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
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String originalString =
                                  fashionList[index].brand.toString();

                              // Initialize trimmedString with the original string
                              String trimmedString = originalString;
                              bool isannual = false;
                              bool iscontain = false;
                              // Check if the string contains "- Annual" or "- Luxe"
                              if (originalString.contains('- Annual') ||
                                  originalString.contains('- Luxe')) {
                                // Split the string based on the separator '- Annual' or '- Luxe'
                                if (originalString.contains('- Annual')) {
                                  List<String> parts =
                                      originalString.split('- Annual').toList();
                                  isannual = true;
                                  // Take the first part, which is everything before '- Annual' or '- Luxe'
                                  trimmedString = parts[0];
                                } else if (originalString.contains('- Luxe')) {
                                  List<String> parts =
                                      originalString.split('- Luxe').toList();
                                  // Take the first part, which is everything before '- Annual' or '- Luxe'
                                  trimmedString = parts[0];
                                }

                                iscontain = true;
                              }
                              return InkWell(
                                borderRadius: BorderRadius.circular(17),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  String branCode =
                                      fashionList[index].brandCode.toString();
                                  if (branCode != null && branCode != '') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardDetailsPage(
                                                  brandCode: branCode,
                                                  voucher: fashionList[index],
                                                )));
                                  }
                                },
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 100),
                                      imageUrl: baseUrl +
                                          fashionList[index]
                                              .defaultImage
                                              .toString(),
                                      height: 140.h,
                                    ),
                                    // Image.network(
                                    //   baseUrl +
                                    //       fashionList[index]
                                    //           .defaultImage
                                    //           .toString(),
                                    //   height: 140.h,
                                    // ),
                                    20.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              // width: 160,
                                              child: Text(
                                                trimmedString,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.09,
                                                ),
                                              ),
                                            ),
                                            3.verticalSpace,
                                            iscontain == false
                                                ? const SizedBox()
                                                : SizedBox(
                                                    child: Text(
                                                      isannual == true
                                                          ? '(Annual Subscription)'
                                                          : '(Luxe Gift Card)',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9.95.sp,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 0.09,
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        3.verticalSpace,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Fashion',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              height: 3.h,
                                              width: 3.w,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                            ),
                                            Text(
                                              fashionList[index]
                                                  .redemptionProcess
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ],
                                        ),
                                        9.verticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              fashionList[index]
                                                  .discount
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF00A91B),
                                                fontSize: 18.95,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.09,
                                              ),
                                            ),
                                            const Text(
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
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                20.verticalSpace,
                            itemCount: fashionList.length),
                      ],
                    ),
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
                    27.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: const Text(
                            'Beauty on a budget',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.80,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ),
                        3.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: Row(
                            children: [
                              const Text(
                                'fantastic discounts!',
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
                                margin: const EdgeInsets.only(left: 10),
                                decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
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
                        ),
                        30.verticalSpace,
                        Container(
                          height: 250.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (index < beautyList.length) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(17),
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        String branCode = beautyList[index]
                                            .brandCode
                                            .toString();
                                        if (branCode != null &&
                                            branCode != '') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CardDetailsPage(
                                                        brandCode: branCode,
                                                        voucher:
                                                            beautyList[index],
                                                      )));
                                        }
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: baseUrl +
                                                beautyList[index]
                                                    .additionalImage
                                                    .toString(),
                                            height: 140.h,
                                          ),
                                          // Image.network(
                                          //   baseUrl +
                                          //       beautyList[index]
                                          //           .additionalImage
                                          //           .toString(),
                                          //   height: 140,
                                          // ),
                                          20.horizontalSpace,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              12.verticalSpace,
                                              Text(
                                                beautyList[index]
                                                    .brand
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.95.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.09,
                                                ),
                                              ),
                                              // 3.verticalSpace,
                                              Row(
                                                children: [
                                                  Text(
                                                    // homePage.beautyBudgetList[index]
                                                    //         .brandName
                                                    //         .toString() +
                                                    'Beauty . ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.06,
                                                    ),
                                                  ),
                                                  Text(
                                                    'offline', // homePage
                                                    //     .beautyBudgetList[index].type
                                                    //     .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.06,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              3.verticalSpace,
                                              Row(
                                                children: [
                                                  Text(
                                                    beautyList[index]
                                                        .discount
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Color(0xFF00A91B),
                                                      fontSize: 18.95,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 0.09,
                                                    ),
                                                  ),
                                                  const Text(
                                                    '% off',
                                                    style: TextStyle(
                                                      color: Color(0xFF00A91B),
                                                      fontSize: 12,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.06,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(),
                              itemCount: 7),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
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
                            const Text(
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
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const ShapeDecoration(
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
                        SizedBox(
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  borderRadius: BorderRadius.circular(17),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    String branCode = entertainmentList[index]
                                        .brandCode
                                        .toString();
                                    if (branCode != null && branCode != '') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CardDetailsPage(
                                                    brandCode: branCode,
                                                    voucher: entertainmentList[
                                                        index],
                                                  )));
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 100),
                                        imageUrl:
                                            '$baseUrl${entertainmentList[index].defaultImage.toString()}',
                                        height: 140.h,
                                      ),
                                      // Image.network(
                                      //   '$baseUrl${entertainmentList[index].defaultImage.toString()}',
                                      //   height: 140.h,
                                      // ),
                                      20.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            entertainmentList[index]
                                                .brand
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
                                                'Entertainment',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.06,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                height: 3.h,
                                                width: 3.w,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                              ),
                                              Text(
                                                entertainmentList[index]
                                                    .redemptionProcess
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.06,
                                                ),
                                              ),
                                            ],
                                          ),
                                          9.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                entertainmentList[index]
                                                    .discount
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Color(0xFF00A91B),
                                                  fontSize: 18.95,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.09,
                                                ),
                                              ),
                                              const Text(
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
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  20.verticalSpace,
                              itemCount: entertainmentList.length),
                        ),
                      ],
                    ),
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
                  ],
                ),
              ),
              30.verticalSpace,
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Image.asset('assets/images/referbanner.png'),
              ),
              20.verticalSpace
            ]),
          ),
        ]),
      ),
    );
  }
}

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MySliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 55.h; // adjust as needed

  @override
  double get maxExtent => 55.h; // adjust as needed

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
