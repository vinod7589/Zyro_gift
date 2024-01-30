// import 'package:abc/src/controller/home_page_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../Utility/constants.dart';
// import '../home_items_page/card_details_page.dart';
//
// class TravelTripWidget extends ConsumerWidget {
//   const TravelTripWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, ref) {
//     var travelController = ref.watch(HomePageController(''));
//     return Column(
//       children: [
//         Container(
//             padding: const EdgeInsets.only(right: 10, left: 10),
//             // width: 300,
//             color: Colors.white.withOpacity(0.9),
//             height: 300.h,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 15.w, top: 15),
//                   child: Text(
//                     'Enjoy the trip, not the costs \ntravel wisely',
//                     style: TextStyle(
//                       color: const Color(0xFF232323),
//                       fontSize: 15.sp,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       letterSpacing: -0.30,
//                     ),
//                   ),
//                 ),
//                 20.verticalSpace,
//                 Expanded(
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         // if (index < tripTravelList.length)
//                         return Padding(
//                           padding: EdgeInsets.only(left: 15.w),
//                           child: InkWell(
//                             onTap: () {
//                               String brandCode = travelController
//                                   .tripTravelList[index].brandCode
//                                   .toString();
//                               if (brandCode != null && brandCode != '') {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => CardDetailsPage(
//                                               brandCode: brandCode,
//                                             )));
//                               }
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.network(
//                                   baseUrl +
//                                       travelController
//                                           .tripTravelList[index].additionalImage
//                                           .toString(),
//                                   height: 160.h,
//                                 ),
//                                 5.verticalSpace,
//                                 SizedBox(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Image.asset('assets/images/'),
//                                       Text(
//                                         travelController
//                                             .tripTravelList[index].brandName
//                                             .toString(),
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13.sp,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             travelController
//                                                 .tripTravelList[index].discount
//                                                 .toString(),
//                                             style: TextStyle(
//                                               color: const Color(0xFF00A91B),
//                                               fontSize: 16.sp,
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w600,
//                                               letterSpacing: 0.08,
//                                             ),
//                                           ),
//                                           Text(
//                                             '% off',
//                                             style: TextStyle(
//                                               color: const Color(0xFF00A91B),
//                                               fontSize: 12.sp,
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w400,
//                                               letterSpacing: 0.06,
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       separatorBuilder: (context, index) => const SizedBox(
//                             width: 0,
//                           ),
//                       itemCount: travelController.tripTravelList.length),
//                 ),
//               ],
//             )),
//       ],
//     );
//   }
// }
