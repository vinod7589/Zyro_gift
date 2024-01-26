import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/home_page_controller.dart';
import '../../../Utility/constants.dart';
import '../home_items_page/card_details_page.dart';

class NewBrandsWidget extends ConsumerWidget {
  const NewBrandsWidget();

  @override
  Widget build(BuildContext context, ref) {
    var newBrandsController = ref.watch(HomePageController(''));
    return Column(
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
              newBrandsController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index <
                                newBrandsController.newBrandList.length) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: InkWell(
                                  onTap: () {
                                    String brandCode = newBrandsController
                                        .newBrandList[index].brandCode
                                        .toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardDetailsPage(
                                                  brandCode: brandCode,
                                                )));
                                  },
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        child: Image.network(baseUrl +
                                            newBrandsController
                                                .newBrandList[index]
                                                .additionalImage
                                                .toString()),
                                      ),
                                      Positioned(
                                        top: 30, // left: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 48),
                                              width: 140,
                                              height: 40,
                                              // color: Colors.red,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Get${newBrandsController.newBrandList[index].discount}% OFF',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.sp,
                                                      fontFamily: 'Poppins',
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
                          separatorBuilder: (context, index) => SizedBox(),
                          itemCount: newBrandsController.newBrandList.length),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
