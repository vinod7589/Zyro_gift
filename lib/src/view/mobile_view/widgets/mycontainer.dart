import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyContainer extends StatelessWidget {
  final String image;
  // final double height;

  const MyContainer({
    required this.image,
  });

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
        child: SvgPicture.asset(
          'assets/images/bill-payments/$image',
          height: 34,
        ));
  }
}
