import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String image;
  final double height;

  const MyContainer({required this.image, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 58,
        width: 58,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Color(0xFF3C3C3C)),
            borderRadius: BorderRadius.circular(30)),
        child: Image.asset(
          'assets/images/$image',
          height: height,
        ));
  }
}
