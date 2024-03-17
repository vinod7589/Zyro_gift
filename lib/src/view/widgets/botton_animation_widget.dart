import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationButton extends StatefulWidget {
  final Function? onPress;
  final Color? color_1;
  final Color? color_2;
  final String title;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  const AnimationButton(
      {this.onPress,
      required this.title,
      this.textStyle,
      this.color_1,
      this.color_2,
      this.width,
      this.height});

  @override
  State<AnimationButton> createState() => AnimationButtonState();
}

class AnimationButtonState extends State<AnimationButton> {
  static const double _shadowHeight = 4;
  double _position = 4;

  haptics() {
    HapticFeedback.mediumImpact();
    sleep(Duration(microseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = 60.h - _shadowHeight;
    return Center(
      child: GestureDetector(
        // onLongPress: () {
        //   HapticFeedback.vibrate();
        // },
        onTap: () {
          // HapticFeedback.vibrate();
          if (widget.onPress != null) {
            // Check if onPress is not null
            widget.onPress!();
          }
        },
        onTapUp: (_) {
          setState(() {
            haptics();

            _position = 4;
          });
        },
        onTapDown: (_) {
          setState(() {
            haptics();
            _position = 0;
          });
        },
        onTapCancel: () {
          setState(() {
            _position = 4;
          });
        },
        child: SizedBox(
          height: _height + _shadowHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                // right: 29.w,
                child: Container(
                  width: widget.width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: widget.color_1 ?? Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(widget.title,
                          style: widget.textStyle ??
                              TextStyle(fontSize: 14.sp, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeInOutCubic,
                bottom: _position,
                duration: Duration(milliseconds: 70),
                child: Container(
                  height: _height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.color_2 ?? Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(widget.title,
                          style: widget.textStyle ??
                              TextStyle(fontSize: 14.sp, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
