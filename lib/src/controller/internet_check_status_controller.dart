import 'dart:async';

import 'package:abc/src/constants/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CheckInternetController =
    ChangeNotifierProvider<checkinternet>((ref) {
  return checkinternet();
});

class checkinternet extends ChangeNotifier {
  checkinternet(
  ) {
    startStreaming();
  }

  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = true;

  // Additional method to check internet connectivity
  Future<void> checkConnectivity() async {
    result = await Connectivity().checkConnectivity();
    isConnected = result != ConnectivityResult.none;
    notifyListeners();
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      await checkConnectivity(); // Utilize the new method to check connectivity
    });
  }

  // checkInterNet() async {
  //   await checkConnectivity(); // Utilize the new method to check connectivity
  //   if (!isConnected) {
  //     // showDialogBox();
  //     getSnackBar(content: 'no inaterne');
  //   }
  // }

  // showDialogBox() {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: _reader.context,
  //     builder: (context) => CupertinoAlertDialog(
  //       title: Text('No Internet'),
  //       content: Text('Please check your internet connection'),
  //       actions: [
  //         CupertinoButton(
  //           child: Text('Retry'),
  //           onPressed: () {
  //             Navigator.pop(context);
  //             checkInterNet();
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
