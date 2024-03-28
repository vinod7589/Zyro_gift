import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(
      {BuildContext? context, required String message, Color? color}) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
