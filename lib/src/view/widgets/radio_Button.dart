import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  final VoidCallback onTap;
  final bool isTapped;
  final Color outSideBorderColor;
  final Color inSideFillColor;

  const RadioButtonWidget(
      {super.key,
      required this.onTap,
      required this.isTapped,
      required this.inSideFillColor,
      required this.outSideBorderColor});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            border: Border.all(color: widget.outSideBorderColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          alignment: Alignment.center,
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: widget.isTapped ? widget.inSideFillColor : null,
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
