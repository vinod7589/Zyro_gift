// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// class SkletonLoader extends StatelessWidget {
//   SkletonLoader({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           physics: BouncingScrollPhysics(),
//           itemCount: 5,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     color: Colors.white70),
//                 child: Container(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.start,
//
//                     // SkeletonAnimation method
//                     children: <Widget>[
//                       Skeleton.leaf(
//                         child: Container(
//                           width: 70.0,
//                           height: 70.0,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 15.0, bottom: 5.0),
//                             child: Skeleton.leaf(
//                               child: Container(
//                                 height: 15,
//                                 width: MediaQuery.of(context).size.width * 0.6,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     color: Colors.grey[300]),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 15.0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 5.0),
//                               child: Skeleton.leaf(
//                                 enabled: true,
//                                 child: Container(
//                                   width: 60,
//                                   height: 13,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                       color: Colors.grey[300]),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
