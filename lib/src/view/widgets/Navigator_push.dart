import 'package:flutter/material.dart';

class NavigatorPush extends StatelessWidget {
  final Widget child;
  final Widget title;

  const NavigatorPush({
    required this.child,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)),
      splashColor: Colors.transparent,
      highlightColor: Colors.deepPurpleAccent.shade100.withOpacity(0.3),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => title));
      },
      child: child,
    );
  }
}
