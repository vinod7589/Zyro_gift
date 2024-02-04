// // import 'dart:async';
// //
// // import 'package:abc/src/view/Utility/constants.dart';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// //
// // final CheckInternetController =
// //     ChangeNotifierProvider.autoDispose<checkinternet>((ref) {
// //   return checkinternet(ref.read);
// // });
// //
// // class checkinternet extends ChangeNotifier {
// //   checkinternet(
// //     this._reader,
// //   ){
// //     startStreaming();
// //   }
// //
// //   final Reader _reader;
// //   late ConnectivityResult result;
// //   late StreamSubscription subscription;
// //   var isConnected = false;
// //
// //   checkInterNet() async {
// //     result = await Connectivity().checkConnectivity();
// //     if (result != ConnectivityResult.none) {
// //       isConnected = true;
// //     } else {
// //       isConnected = false;
// //       Text(
// //         'No intenet',
// //         style: TextStyle(fontSize: 30, color: Colors.red),
// //       );
// //     }
// //     notifyListeners();
// //   }
// //
// //   // showDialogBox() {
// //   //   showDialog(context: ,
// //   //       barrierDismissible: false,
// //   //       builder: (context) => CupertinoAlertDialog(
// //   //             title: Text('No InterNet'),
// //   //             content: Text('Please check your internet connection'),
// //   //             actions: [
// //   //               CupertinoButton(
// //   //                   child: Text('Retry'),
// //   //                   onPressed: () {
// //   //                     Navigator.pop(context);
// //   //                     checkInterNet();
// //   //                   })
// //   //             ],
// //   //           ));
// //   // }
// //
// //   startStreaming() {
// //     subscription = Connectivity().onConnectivityChanged.listen((event) async {
// //       checkInterNet();
// //     });
// //   }
// // }
//
// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class nointernet extends StatefulWidget {
//   const nointernet({super.key});
//
//   @override
//   State<nointernet> createState() => nointernetState();
// }
//
// startStreaming() {
//   subscription = Connectivity().onConnectivityChanged.listen((event) async {
//     checkInterNet();
//   });
// }
//
// checkInterNet() async {
//   result = await Connectivity().checkConnectivity();
//   if (result != ConnectivityResult.none) {
//     isConnected = true;
//   } else {
//     isConnected = false;
//     Text(
//       'No intenet',
//       style: TextStyle(fontSize: 30, color: Colors.red),
//     );
//   }
// }
//
// late ConnectivityResult result;
// var isConnected = false;
//
// late StreamSubscription subscription;
//
// class nointernetState extends State<nointernet> {
// // showDialogBox() {
// //   showDialog(context: ,
// //       barrierDismissible: false,
// //       builder: (context) => CupertinoAlertDialog(
// //             title: Text('No InterNet'),
// //             content: Text('Please check your internet connection'),
// //             actions: [
// //               CupertinoButton(
// //                   child: Text('Retry'),
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                     checkInterNet();
// //                   })
// //             ],
// //           ));
// // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
