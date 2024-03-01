import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/controller/search_page_pagination_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

import '../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../constants/base_url.dart';
import '../home_page/home_items_page/card_details_page.dart';

class SearchBrandPaginationPage extends ConsumerStatefulWidget {
  const SearchBrandPaginationPage({super.key});

  @override
  ConsumerState<SearchBrandPaginationPage> createState() =>
      _SearchBrandPaginationPageState();
}

class _SearchBrandPaginationPageState
    extends ConsumerState<SearchBrandPaginationPage> {
  @override
  Widget build(BuildContext context) {
    // var checkInternetController = ref.watch(CheckInternetController);
    var filteredBrandPaginationProvider =
        ref.watch(searchPagePaginationProvider);
    final filteredBrandList = filteredBrandPaginationProvider.filteredBrandList;

    return filteredBrandPaginationProvider.isFirstLoadRunning
        ? SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          )
        : filteredBrandPaginationProvider.isFirstError
            ? SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            filteredBrandPaginationProvider.firstErrorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (filteredBrandPaginationProvider
                                    .firstErrorMessage !=
                                "Session Expired...") {
                              filteredBrandPaginationProvider.refresh();
                            } else {}
                          },
                          child: Text(filteredBrandPaginationProvider
                                      .firstErrorMessage ==
                                  "Session Expired..."
                              ? "SignIn Again"
                              : "Retry"),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : filteredBrandList.isNotEmpty
                ? SliverList.separated(
                    separatorBuilder: (c, i) => SizedBox(
                      height: 17,
                    ),
                    itemBuilder:
                        // delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      String originalString = filteredBrandPaginationProvider
                          .filteredBrandList[index].brand
                          .toString();

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
                      if (index == filteredBrandList.length) {
                        if (filteredBrandPaginationProvider.isLoadMoreRunning) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (filteredBrandPaginationProvider
                            .isLoadMoreError) {
                          return Container(
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                filteredBrandPaginationProvider
                                    .loadMoreErrorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      } else {
                        return InkWell(
                          borderRadius: BorderRadius.circular(17),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            String branCode = filteredBrandPaginationProvider
                                .filteredBrandList[index].brandCode
                                .toString();
                            if (branCode != '') {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: CardDetailsPage(
                                        brandCode: branCode,
                                        voucher: filteredBrandList[index],
                                      ),
                                      type: PageTransitionType.theme));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CardDetailsPage(
                              //               brandCode: branCode,
                              //               voucher: filteredBrandList[index],
                              //             )));
                            }
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 100),
                                  imageUrl: baseUrl +
                                      filteredBrandPaginationProvider
                                          .filteredBrandList[index].defaultImage
                                          .toString(),
                                  fit: BoxFit.fill,
                                  height: 130.h,
                                  errorWidget: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/errorimages1.png',
                                    );
                                  },
                                  placeholder: (context, url) => Skeleton(
                                    shimmerGradient: const LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.white70,
                                        Colors.black54,
                                      ],
                                      stops: [
                                        0.1,
                                        0.5,
                                        1,
                                      ],
                                    ),
                                    isLoading: filteredBrandPaginationProvider
                                            .isLoading ==
                                        true,
                                    skeleton: const SizedBox(),
                                    child: SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            width: 152.h,
                                            height: 132.h)),
                                  ),
                                ),
                              ),
                              20.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // width: 160,
                                        child: SizedBox(
                                          width: 160.w,
                                          child: Text(
                                            trimmedString,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.09,
                                            ),
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
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.09,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  3.verticalSpace,
                                  SizedBox(
                                    width: 150,
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.start,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          filteredBrandPaginationProvider
                                              .filteredBrandList[index].category
                                              .toString()
                                              .split('&')[0]
                                              .trim(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.06,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: 3.h,
                                          width: 3.w,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                        ),
                                        Text(
                                          filteredBrandPaginationProvider
                                              .filteredBrandList[index]
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
                                  ),
                                  9.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        filteredBrandPaginationProvider
                                            .filteredBrandList[index].discount
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF00A91B),
                                          fontSize: 18.95.sp,
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
                      }
                    },
                    itemCount: filteredBrandList.length,
                    // ),
                  )
                : SliverToBoxAdapter(
                    child: SizedBox(
                        height: 400,
                        child: Center(
                            child: Text(
                          "Not found",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ))),
                  );
  }
}
