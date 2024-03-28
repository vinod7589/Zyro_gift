import 'package:flutter/material.dart';

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  const ShinyButton(
      {super.key, required this.child, required this.color, this.onTap});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: widget.child,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    // tileMode: TileMode.clamp,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.color,
                      Colors.white,
                      widget.color,
                    ],
                    stops: [
                      0.0,
                      animationController.value,
                      1.0,
                      // animationController.value,
                    ])),
          );
        });
  }
}
