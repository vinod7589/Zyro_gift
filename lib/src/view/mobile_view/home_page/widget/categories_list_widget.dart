import 'package:abc/src/view/Utility/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/home_page_controller.dart';

class CategoriesListWidget extends ConsumerWidget {
  const CategoriesListWidget();

  @override
  Widget build(BuildContext context, ref) {
    var categoriesController = ref.watch(HomePageController(''));

    return Column(
      children: [
        Container(
          height: constants.searchBarHeight,
          color: const Color.fromRGBO(35, 35, 35, 1),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              readOnly: true,
              controller: categoriesController.searchBarTextEditingController,
              // isEnable = true;
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  contentPadding: const EdgeInsets.only(
                    left: 2,
                    top: 10,
                    bottom: 8,
                  ),
                  suffixIcon: categoriesController
                          .searchBarTextEditingController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                              onPressed: () {
                                // isEnable = true;7
                                categoriesController
                                    .searchBarTextEditingController
                                    .clear();

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
                      padding: const EdgeInsets.only(left: 10, right: 0),
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
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.white)))),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Container(
            height: 50.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoriesController.categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             CategoriesPage())),
                  child: Column(
                    children: [
                      Image.network(
                        '$baseUrl${categoriesController.categoriesList[index].categoryImage}',
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
                        categoriesController.categoriesList[index].categoryName
                            .toString(),
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 12.07.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                          letterSpacing: 0.06,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
