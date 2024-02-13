import 'dart:developer';

import 'package:abc/src/controller/search_page_pagination_controller.dart';
import 'package:abc/src/view/mobile_view/searchPage/search_brand_pagination_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:abc/src/view/Utility/constants.dart';

import '../../../controller/internet_check_status_controller.dart';
import '../no_internet_page.dart';

class SearchMobilePage extends ConsumerStatefulWidget {
  const SearchMobilePage({super.key});

  @override
  ConsumerState<SearchMobilePage> createState() => _SearchMobilePageState();
}

class _SearchMobilePageState extends ConsumerState<SearchMobilePage> {
  String extractFirstSentence(String input) {
    // Extract the first sentence before "&" or "and"
    String firstSentence = input.split(" ").first;
    return firstSentence;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(CheckInternetController.notifier).startStreaming();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(searchPagePaginationProvider.notifier)
          .searchBarTextEditingController
          .clear();
      ref.watch(searchPagePaginationProvider.notifier)..searchClear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var checkInternetController = ref.watch(CheckInternetController);
    // var filteredBrandPaginationProvider= ref.watch(searchPageProvider);
    var filteredBrandPaginationProvider =
        ref.watch(searchPagePaginationProvider);

    return checkInternetController.isConnected
        ? Scaffold(
            backgroundColor: const Color(0xFF232323),

            // appBar: AppBar(),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () => Future.sync(
                    () => filteredBrandPaginationProvider.refresh()),
                child: CustomScrollView(
                  controller: filteredBrandPaginationProvider.controller,
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 15),
                      sliver: SliverAppBar(
                        leading: SizedBox(),
                        // toolbarHeight: 65.h,
                        pinned: false,
                        floating: true,
                        scrolledUnderElevation: 0,
                        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                        flexibleSpace: Container(
                          height: constants.searchBarHeight,
                          color: const Color.fromRGBO(35, 35, 35, 1),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                              autofocus: true,
                              controller: filteredBrandPaginationProvider
                                  .searchBarTextEditingController,
                              // isEnable = true;
                              onChanged: (s) {
                                filteredBrandPaginationProvider.search();
                              },
                              onTapOutside: (e) =>
                                  FocusScope.of(context).unfocus(),
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      borderSide:
                                          BorderSide(color: Color(0xFF545454))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF545454)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  contentPadding: const EdgeInsets.only(
                                    left: 2,
                                    top: 10,
                                    bottom: 8,
                                  ),
                                  suffixIcon: filteredBrandPaginationProvider
                                          .searchBarTextEditingController
                                          .text
                                          .isNotEmpty
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: IconButton(
                                              onPressed: () {
                                                // isEnable = true;7
                                                filteredBrandPaginationProvider
                                                    .searchClear();

                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              icon: const Icon(
                                                Icons.clear,
                                                color: Colors.white70,
                                              )),
                                        )
                                      : Container(
                                          width: 60,
                                          padding: const EdgeInsets.all(13),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/images/Search.png',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white70,
                                      )),
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFB5B5B5),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "Search for Brands",
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      borderSide: BorderSide(
                                          color: Color(0xFF545454))))),
                        ),
                      ),
                    ),
                    if (filteredBrandPaginationProvider.searchQuery != "")
                      SliverToBoxAdapter(
                        child: SizedBox(),
                      )
                    else
                      SliverAppBar(
                        leading: SizedBox(),
                        leadingWidth: 0,
                        toolbarHeight: 73.h,
                        pinned: true,
                        scrolledUnderElevation: 0,
                        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
                        flexibleSpace: Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey.shade800.withOpacity(0.4),
                            ))),
                            // height: 75.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: filteredBrandPaginationProvider
                                  .categoriesList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    filteredBrandPaginationProvider
                                        .selectCategory(index);
                                    log("ASDFSD${index}");
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 100),
                                            fadeOutDuration:
                                                Duration(milliseconds: 100),
                                            placeholderFadeInDuration:
                                                Duration(milliseconds: 50),
                                            imageUrl:
                                                '$baseUrl${filteredBrandPaginationProvider.categoriesList[index].categoryImage}',
                                            height: 33.h,
                                          ),
                                          10.verticalSpace,
                                          SizedBox(
                                            child: Text(
                                              filteredBrandPaginationProvider
                                                  .categoriesList[index]
                                                  .categoryName
                                                  .toString(),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: const Color(0xFFFAFAFA),
                                                fontSize: 12.07.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          filteredBrandPaginationProvider
                                                      .selectedIndex ==
                                                  index
                                              ? Container(
                                                  width: 62.w,
                                                  height: 3.h,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(7),
                                                        topRight:
                                                            Radius.circular(7),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      sliver: SearchBrandPaginationPage(),
                    ),
                  ],
                ),
              ),
            ))
        : NoInternetPage(() {
            filteredBrandPaginationProvider.refresh();
          }, context);
  }
}
// class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//
//   MySliverAppBarDelegate({required this.child});
//
//   @override
//   double get minExtent => 75.h; // adjust as needed
//
//   @override
//   double get maxExtent => 75.h; // adjust as needed
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset,
//       bool overlapsContent) {
//     return child;
//   }
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
