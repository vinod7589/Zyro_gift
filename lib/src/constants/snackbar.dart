import 'package:flutter/material.dart';

SnackBar getSnackBar({required String content, Color color = Colors.red}) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(content),
    backgroundColor: color,
  );
}
