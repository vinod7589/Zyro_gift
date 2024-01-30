import 'dart:developer';

import 'package:abc/src/controller/search_page_pagination_controller.dart';
import 'package:abc/src/view/mobile_view/searchPage/search_brand_pagination_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:abc/src/view/Utility/constants.dart';

import '../../../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../../../model/homePage/getall_categories_model.dart';
import '../home_page/home_items_page/card_details_page.dart';

class SearchMobilePage extends ConsumerStatefulWidget {
  const SearchMobilePage({super.key});

  @override
  ConsumerState<SearchMobilePage> createState() => _SearchMobilePageState();
}

class _SearchMobilePageState extends ConsumerState<SearchMobilePage> {
  @override
  Widget build(BuildContext context) {
   // var filteredBrandPaginationProvider= ref.watch(searchPageProvider);
   var filteredBrandPaginationProvider= ref.watch(searchPagePaginationProvider);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),

        // appBar: AppBar(),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () =>
                Future.sync(() => filteredBrandPaginationProvider.refresh()),
            child: CustomScrollView(
              controller:filteredBrandPaginationProvider.controller ,
              slivers: [
                SliverAppBar(
                  leading: const Text(''),
                  toolbarHeight: 65.h,
                  pinned: false,
                  floating: true,
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                  flexibleSpace: Container(
                    height: constants.searchBarHeight,
                    color: const Color.fromRGBO(35, 35, 35, 1),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: filteredBrandPaginationProvider.searchBarTextEditingController,
                        // isEnable = true;
                        onChanged: (s){
                          filteredBrandPaginationProvider.search();
                        },
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

                            suffixIcon:filteredBrandPaginationProvider. searchBarTextEditingController
                                    .text.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: IconButton(
                                        onPressed: () {
                                          // isEnable = true;7
                                          filteredBrandPaginationProvider.     searchClear();

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
                ),
                filteredBrandPaginationProvider.searchQuery!=""?SliverToBoxAdapter(child: SizedBox(),):  SliverAppBar(
                  leading: const Text(''),
                  toolbarHeight: 65.h,
                  pinned: true,
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SizedBox(
                      height: 60.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 30,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:filteredBrandPaginationProvider. categoriesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              filteredBrandPaginationProvider.selectCategory(index);
                              log("ASDFSD${index}");
                            },
                            child: Container(
                              width: 70,
                              height: 80,
                              child: Column(
                                children: [
                                  Image.network(
                                    '$baseUrl${filteredBrandPaginationProvider.categoriesList[index].categoryImage}',
                                    height: 30.h,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/noimage.png',
                                        height: 30.h,
                                      );
                                    },
                                  ),
                                  10.verticalSpace,
                                  Text(
                                      filteredBrandPaginationProvider.   categoriesList[index].categoryName.toString(),
                                    style: TextStyle(

                                      color: const Color(0xFFFAFAFA),
                                      fontSize: 12.07.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                      letterSpacing: 0.06,
                                    ),
                                  ),
                                  Spacer(),
                                  filteredBrandPaginationProvider.selectedIndex==index?  Container(
                                    width: 62,
                                    height: 3,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                  ):SizedBox()
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverPadding(padding:EdgeInsets.symmetric(horizontal: 23),

                sliver:                SearchBrandPaginationPage(),

                )

              ],
            ),
          ),
        ));
  }
}
