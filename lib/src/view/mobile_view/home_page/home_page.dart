import 'dart:math';

import 'package:abc/src/infrastructure/repository/homePage_repo/getAllPopularBrandsModel.dart';
import 'package:abc/src/infrastructure/repository/homePage_repo/home_page_repo.dart';
import 'package:abc/src/model/homePage/price_list_model.dart';
import 'package:abc/src/model/homePage/amazing_fashion_model.dart';
import 'package:abc/src/model/homePage/beauty_budget_model.dart';
import 'package:abc/src/model/homePage/tripTravel_Model.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/test_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../testfile/custom_keyboard.dart';
import '../../../Packages/carousel_slider/carousel_slider.dart';
import '../../../Packages/page_transition/enum.dart';
import '../../../Packages/page_transition/page_transition.dart';
import '../../../model/homePage/getbrand_details_model.dart';
import '../../../model/homePage/new_brands_model.dart';
import '../../widgets/dialogs/loader.dart';
import '../bottomNavigationBar_tabs/pofile_page.dart';
import 'home_items_page/myntra_card_page.dart';
import 'widget/Home_globalPage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class RangeModel {
  int start = 0;
  int end = 0;
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    getPopularBrands();
    travelTrip();
    NewBrand();
    fashion();
    beauty();
  }

  List<GetAllPopularBrandList> allPopularBrands = [];

  Future<void> getPopularBrands() async {
    isLoading = true;

    allPopularBrands =
        await HomePageService.getAllPopularBrandsService("") ?? [];
    isLoading = false;
    setState(() {});

    print(isLoading);
  }

  List<TravelTrip> tripTravelList = [];

  Future<void> travelTrip() async {
    isLoading = true;
    tripTravelList = await HomePageService.travelTripService("") ?? [];
    isLoading = false;

    setState(() {});
  }

  List<NewBrandList> newBrandList = [];

  Future<void> NewBrand() async {
    isLoading = true;
    newBrandList = await HomePageService.newBrandListService("") ?? [];
    isLoading = false;

    setState(() {});
  }

  List<FashionList> fashionList = [];

  Future<void> fashion() async {
    isLoading = true;
    fashionList = await HomePageService.fashionService("") ?? [];
    isLoading = false;

    setState(() {});
  }

  List<BeautyList> beautyList = [];

  Future<void> beauty() async {
    isLoading = true;
    beautyList = await HomePageService.beautyService("") ?? [];
    isLoading = false;

    setState(() {});
  }

  TextEditingController searchBarTextEditingController =
      TextEditingController();
  bool isEnable = true;
  bool isLoading = true;

  final TextEditingController _numKeyboardTextEditingController =
      TextEditingController();

  RangeModel manageDenomition(denomination, range) {
    RangeModel currentRange = RangeModel();
    if (denomination != '') {
      List<String> parts = range.split('-');
      if (parts.length == 2) {
        currentRange.start = int.tryParse(parts[0].trim()) ?? 0;
        currentRange.end = int.tryParse(parts[1].trim()) ?? 0;
      }
    }
    return currentRange;
  }

  List<double> priceList = [];

////////GetBrandsDetails////////////

  String brandCode = '';

  getBrandDetails(brandCode) async {
    try {
      GetBrandDetailsList? brandDetails =
          await HomePageService.getBrandDetailsService(brandCode);

      if (brandDetails != null) {
        if (brandDetails.brandtype == 'Variable') {
          var res = manageDenomition(
              brandDetails.denominationList, brandDetails.denominationList);
          print('start:' + res.start.toString());
          print('end:' + res.end.toString());
          showModalBottomSheet(
            elevation: 0,
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color(0xFF2C2C2C),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            )),
            builder: (context) => Consumer(builder: (context, ref, child) {
              var homePage = ref.watch(HomeGlobalPage);
              return SingleChildScrollView(
                // controller: scrollController,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    separatorBuilder: (context, index) => const Divider(
                          color: Color(0xFFEFEFEF),
                          thickness: 2,
                        ),
                    itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                24.verticalSpace,
                                Container(
                                  width: 76,
                                  height: 5,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF444444),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(91),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15),
                              width: double.infinity,
                              height: 210.h,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade800
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFF494949),
                                  )),
                              child: Column(
                                children: [
                                  28.verticalSpace,
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
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    // color:
                                    //     Colors.red,
                                    width: 140.w,
                                    height: 36.h,
                                    child: Center(
                                      child: TextFormField(
                                        controller:
                                            _numKeyboardTextEditingController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        onTapOutside: (e) =>
                                            FocusScope.of(context).unfocus(),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.none,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                        decoration: const InputDecoration(
                                            // prefixIcon: Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 20,
                                            //       right: 0),
                                            //   child: Text(
                                            //       '₹',
                                            //       style: TextStyle(fontSize: 25.sp, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                                            // ),
                                            contentPadding: EdgeInsets.only(
                                                left: 0, top: 1, bottom: 7),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide.none),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide.none),
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            hintText: '0'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '. . . .',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'Zyro Gifts',
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
                                  ),
                                ],
                              ),
                            ),
                            15.verticalSpace,
                            NumericKeypad(
                                controller: _numKeyboardTextEditingController),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyntraCardPAge()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 320.w,
                                    height: 51.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFF8C8C8C)),
                                        borderRadius: BorderRadius.circular(66),
                                      ),
                                    ),
                                    child: const Text(
                                      'Proceed',
                                      style: TextStyle(
                                        color: Color(0xFF2C2C2C),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.08,
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
          //////////////////
        } else if (brandDetails.brandtype == 'Fixed') {
          final denominationList = brandDetails.denominationList;
          if (denominationList != null) {
            List<String> array = denominationList.split(',');
            priceList = array.map((e) => double.tryParse(e) ?? 0).toList();
            print(priceList);
          }
          showModalBottomSheet(
            elevation: 0,
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color(0xFF2C2C2C),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            )),
            builder: (context) => Consumer(builder: (context, ref, child) {
              var homePage = ref.watch(HomeGlobalPage);
              return SingleChildScrollView(
                // controller: scrollController,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    separatorBuilder: (context, index) => const Divider(
                          color: Color(0xFFEFEFEF),
                          thickness: 2,
                        ),
                    itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                24.verticalSpace,
                                Container(
                                  width: 76,
                                  height: 5,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF444444),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(91),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15),
                              width: double.infinity,
                              height: 210.h,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade800
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFF494949),
                                  )),
                              child: Column(
                                children: [
                                  28.verticalSpace,
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
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: ' ₹ ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23.14,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.46,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${homePage.getTotalamount().toString().replaceAll(homePage.regex, '')}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 23.14,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.46,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '. . . .',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'Zyro Gifts',
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
                                  ),
                                ],
                              ),
                            ),
                            15.verticalSpace,
                            ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  AddMoney addMoney = homePage.amount[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      //
                                      children: [
                                        Text(
                                          '₹ ' + priceList[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.08,
                                          ),
                                        ),
                                        Container(
                                            height: 35,
                                            width: 113,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                    color: Colors.white)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0),
                                                    onPressed: () {
                                                      homePage.decreaseNumber(
                                                          double, index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    child: Text(
                                                      addMoney.quantity
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            addMoney.quantity >
                                                                    0
                                                                ? const Color(
                                                                    0xFFAD62FF)
                                                                : Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.27,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                    padding:
                                                        const EdgeInsets.only(),
                                                    onPressed: () {
                                                      homePage.increaseNumber(
                                                          double, index);
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
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 20,
                                    ),
                                itemCount: priceList.length),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyntraCardPAge()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 320.w,
                                    height: 51.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFF8C8C8C)),
                                        borderRadius: BorderRadius.circular(66),
                                      ),
                                    ),
                                    child: const Text(
                                      'Proceed',
                                      style: TextStyle(
                                        color: Color(0xFF2C2C2C),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.08,
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
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TestFile()));
      }
    } catch (error) {
      // Handle any errors that occur during the service call
      print('Error: $error');
    }
  }

////////GetBrandsDetails////////////

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Zyro Gift',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white),
                )
              ],
            ),
          ),
          SliverAppBar(
            leading: Text(''),
            toolbarHeight: 65,
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
                            top: 10,
                            bottom: 8,
                          ),
                          suffixIcon: searchBarTextEditingController
                                  .text.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: IconButton(
                                      onPressed: () {
                                        // isEnable = true;
                                        searchBarTextEditingController.clear();

                                        FocusScope.of(context).unfocus();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      )),
                                )
                              : null,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(13),
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
                // 20.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.only(left: 15.w),
                //   child: Container(
                //     height: 68.h,
                //     child: ListView.separated(
                //       separatorBuilder: (context, index) => const SizedBox(
                //         width: 30,
                //       ),
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: homePage.allCategoriesList.length,
                //       itemBuilder: (context, index) {
                //         return Column(
                //           children: [
                //             Image.asset(
                //               homePage.allCategoriesList[index].categoriesImage
                //                   .toString(),
                //               height: 40,
                //             ),
                //             10.verticalSpace,
                //             Text(
                //               homePage.allCategoriesList[index].title
                //                   .toString(),
                //               style: TextStyle(
                //                 color: const Color(0xFFFAFAFA),
                //                 fontSize: 12.07.sp,
                //                 fontFamily: 'Poppins',
                //                 fontWeight: FontWeight.w500,
                //                 height: 0.09,
                //                 letterSpacing: 0.06,
                //               ),
                //             )
                //           ],
                //         );
                //       },
                //     ),
                //   ),
                // )
                // 10.verticalSpace,
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
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: 340,
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
                                        childAspectRatio:
                                            0.9 // Spacing between rows
                                        ),
                                itemCount: allPopularBrands.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index < allPopularBrands.length) {
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(17),
                                      onTap: () {
                                        getBrandDetails(
                                            allPopularBrands[index].brandCode);
                                      },
                                      child: Container(
                                        // padding: EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        child: Column(
                                          children: [
                                            Stack(children: [
                                              Image.network(
                                                baseUrl +
                                                    allPopularBrands[index]
                                                        .additionalImage,
                                                // height: 145.h,
                                              ),
                                              Positioned(
                                                top: 20,
                                                child: Container(
                                                  // color: Colors.red,
                                                  width: 165,
                                                  height: 60,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SizedBox(
                                                              width: 80,
                                                              child: Text(
                                                                maxLines: 1,
                                                                allPopularBrands[
                                                                        index]
                                                                    .brandName,
                                                                style:
                                                                    TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  fontSize:
                                                                      13.49.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      0.06,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 80,
                                                                child: RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text: allPopularBrands[
                                                                            index]
                                                                        .discount
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFF5F5F5),
                                                                      fontSize:
                                                                          17.49
                                                                              .sp,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      letterSpacing:
                                                                          0.06,
                                                                    ),
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            ' % off',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFFFEFEFE),
                                                                          fontSize:
                                                                              12.49,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                      height: 170.h,
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

              // 40.verticalSpace,
              // 20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xFF313131),
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
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                height: 200,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if (index < newBrandList.length) {
                                        return Padding(
                                          padding: EdgeInsets.only(left: 15.w),
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                child: Image.network(baseUrl +
                                                    newBrandList[index]
                                                        .additionalImage
                                                        .toString()),
                                              ),
                                              Positioned(
                                                top: 30,
                                                // left: 20,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 48),
                                                      width: 140,
                                                      height: 40,
                                                      // color: Colors.red,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Get' +
                                                                newBrandList[
                                                                        index]
                                                                    .discount
                                                                    .toString() +
                                                                '% OFF',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                        );
                                      }
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(),
                                    itemCount: newBrandList.length),
                              ),
                      ],
                    ),
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
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
                              20.verticalSpace,
                              Expanded(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      // if (index < tripTravelList.length)
                                      return Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              baseUrl +
                                                  tripTravelList[index]
                                                      .additionalImage
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
                                                    tripTravelList[index]
                                                        .brandName
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        tripTravelList[index]
                                                            .discount
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xFF00A91B),
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
                                                          color: const Color(
                                                              0xFF00A91B),
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
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 0,
                                        ),
                                    itemCount: tripTravelList.length),
                              ),
                            ],
                          )),
                  40.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 10),
                    child: Column(
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
                                  fashionList[index].brandName.toString();

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
                              return Row(
                                children: [
                                  Image.network(
                                    baseUrl +
                                        fashionList[index]
                                            .defaultImage
                                            .toString(),
                                    height: 140.h,
                                  ),
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
                                              ? SizedBox()
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
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            height: 3.h,
                                            width: 3.w,
                                            decoration: BoxDecoration(
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
                              );
                            },
                            separatorBuilder: (context, index) =>
                                20.verticalSpace,
                            itemCount: fashionList.length),
                      ],
                    ),
                  ),
                  20.verticalSpace,
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
                  20.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
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
                        padding: EdgeInsets.only(left: 15.w),
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
                      ),
                      20.verticalSpace,
                      Container(
                        height: 270,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (index < beautyList.length)
                                return Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        baseUrl +
                                            beautyList[index]
                                                .additionalImage
                                                .toString(),
                                        height: 140.h,
                                      ),
                                      20.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          12.verticalSpace,
                                          Text(
                                            beautyList[index]
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
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.06,
                                                ),
                                              ),
                                              Text(
                                                'offline',
                                                // homePage
                                                //     .beautyBudgetList[index].type
                                                //     .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
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
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: 7),
                      ),
                    ],
                  ),
                  // 25.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 10),
                    child: Column(
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
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
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
                              );
                            },
                            separatorBuilder: (context, index) =>
                                20.verticalSpace,
                            itemCount: 4),
                      ],
                    ),
                  ),

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
