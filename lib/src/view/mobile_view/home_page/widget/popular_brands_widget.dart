import 'package:abc/src/controller/home_page_controller.dart';
import 'package:abc/src/view/mobile_view/home_page/widget/Home_globalPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utility/constants.dart';
import '../home_items_page/card_details_page.dart';

class PopularBrandsWidget extends ConsumerWidget {
  const PopularBrandsWidget(this.brandCode);
  final String brandCode;

  @override
  Widget build(BuildContext context, ref) {
    var popularBrands = ref.watch(HomePageController(brandCode));

    return popularBrands.isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            height: 340,
            child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.9 // Spacing between rows
                    ),
                itemCount: popularBrands.allPopularBrands.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index < popularBrands.allPopularBrands.length) {
                    return GestureDetector(
                      onTap: () {
                        popularBrands.isLoading;
                        String branCode = popularBrands
                            .allPopularBrands[index].brandCode
                            .toString();
                        print(branCode);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardDetailsPage(brandCode: branCode)));
                        popularBrands.isLoadingFalse;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Column(
                          children: [
                            Stack(children: [
                              Image.network(
                                baseUrl +
                                    popularBrands.allPopularBrands[index]
                                        .additionalImage,
// height: 145.h,
                              ),
                              Positioned(
                                top: 20,
                                child: Container(
// color: Colors.red,
                                  width: 165,
// height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                popularBrands
                                                    .allPopularBrands[index]
                                                    .brandName,
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.visible,
                                                  color: Color(0xFFF5F5F5),
                                                  fontSize: 13.49.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.06,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: 80,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: popularBrands
                                                        .allPopularBrands[index]
                                                        .discount
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(0xFFF5F5F5),
                                                      fontSize: 17.49.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 0.06,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: ' % off',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFFEFEFE),
                                                          fontSize: 12.49,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: 0.06,
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
          );
  }
}
