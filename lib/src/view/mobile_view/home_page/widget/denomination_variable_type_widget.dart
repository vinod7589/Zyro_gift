// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../testfile/custom_keyboard.dart';
// import '../../../Utility/constants.dart';
// import '../home_items_page/payment_option_page.dart';
//
// class DenominationVariableTypeWidget extends StatelessWidget {
//   const DenominationVariableTypeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: 1,
//         separatorBuilder: (context, index) => const Divider(
//           color: Color(0xFFEFEFEF),
//           thickness: 2,
//         ),
//         itemBuilder: (context, index) => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 24.verticalSpace,
//                 Container(
//                   width: 76,
//                   height: 5,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFF444444),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(91),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   left: 20, right: 20, top: 15),
//               width: double.infinity,
//               height: 210.h,
//               decoration: BoxDecoration(
//                   color: Colors.deepPurple.shade800
//                       .withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: const Color(0xFF494949),
//                   )),
//               child: Column(
//                 children: [
//                   28.verticalSpace,
//                   Image.network(
//                     "$baseUrl${fixedCardProvider.brandDetails!.image.toString()}",
//                     height: 40.h,
//                   ),
//                   14.verticalSpace,
//                   const Text(
//                     'Card worth',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12.06,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 0.24,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     // color:
//                     //     Colors.red,
//                     width: 140.w,
//                     height: 36.h,
//                     child: Center(
//                       child: TextFormField(
//                         controller: homePageController
//                             .numKeyboardTextEditingController,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(6),
//                           FilteringTextInputFormatter
//                               .digitsOnly,
//                         ],
//                         onTapOutside: (e) =>
//                             FocusScope.of(context).unfocus(),
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.none,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 23.sp,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600),
//                         decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.only(
//                                 left: 0, top: 1, bottom: 7),
//                             border: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             hintStyle:
//                             TextStyle(color: Colors.white),
//                             hintText: '0'),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               bottom: 10, left: 20, right: 20),
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '. . . .',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20.sp,
//                                     fontWeight:
//                                     FontWeight.w700),
//                               ),
//                               Text(
//                                 'Zyro Gifts',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12.50.sp,
//                                   fontFamily: 'Urbanist',
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             10.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Please enter amount between ${res.start} and ${res.end}',
//                   style: TextStyle(color: Colors.red),
//                 )
//               ],
//             ),
//             15.verticalSpace,
//             NumericKeypad(
//                 controller: homePageController
//                     .numKeyboardTextEditingController),
//             20.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 PaymentOptionPage()));
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 320.w,
//                     height: 51.h,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             width: 1, color: Color(0xFF8C8C8C)),
//                         borderRadius: BorderRadius.circular(66),
//                       ),
//                     ),
//                     child: const Text(
//                       'Proceed',
//                       style: TextStyle(
//                         color: Color(0xFF2C2C2C),
//                         fontSize: 16,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.08,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             20.verticalSpace,
//           ],
//         )),
//   }
// }
