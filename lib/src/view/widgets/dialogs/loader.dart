import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftLoader extends StatefulWidget {
  @override
  _GiftLoaderState createState() => _GiftLoaderState();
}

class _GiftLoaderState extends State<GiftLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: 60.w,
          height: 60.h,
          child: Stack(
            children: [
              // Gift box container
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFDBCEF5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              // Gift box icon
              Center(
                  child: Icon(
                Icons.wallet_giftcard_sharp,
                color: Color(0xFF5801B7),
                size: 30,
              )),
              // Ribbon on the gift box
            ],
          ),
        ),
      ),
    );
  }
}
