import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/view/mobile_view/home_page/home_items_page/payment_option_page.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;
  final int startValue;
  final int endValue;
  const NumericKeypad(
      {Key? key,
      required this.controller,
      required this.startValue,
      required this.endValue})
      : super(key: key);

  @override
  State<NumericKeypad> createState() =>
      //_NumericKeypadState(this.controller, this.startValue, this.endValue);
      _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;
  int lower = 0;
  int upper = 0;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    lower = widget.startValue;
    upper = widget.endValue;
    current_net_value = lower;
  }

  @override
  void dispose() {
    // Dispose of the controller
    _controller.clear();
    super.dispose();
  }

  int current_net_value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              current_net_value >= lower && current_net_value <= upper
                  ? ''
                  : 'Please enter amount between ${lower} and ${upper}',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            _buildButton(
              '1',
            ),
            _buildButton('2'),
            _buildButton('3'),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Row(
          children: [
            _buildButton('',
                onPressed: () {}), // Placeholder for an empty button
            _buildButton('0'),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (int.parse(_controller.text) >= lower &&
                    int.parse(_controller.text) <= upper) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentOptionPage()));
                } else {}
              },
              child: Container(
                alignment: Alignment.center,
                width: 320.w,
                height: 51.h,
                decoration: ShapeDecoration(
                  color: (int.parse(_controller.text) >= lower &&
                          int.parse(_controller.text) <= upper)
                      ? Colors.white
                      : Colors.black54,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF8C8C8C)),
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed ?? () => _input(text),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  void _input(String text) {
    _controller.text = '${_controller.text}$text';
    _controller.notifyListeners();
    setState(() {
      current_net_value = int.parse(_controller.text);
    });
  }

  void _backspace() {
    // Handle backspace logic, remove the last character from the controller
    if (_controller.text.isNotEmpty) {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
      _controller.notifyListeners();
      setState(() {
        current_net_value = int.parse(_controller.text);
      });
    }
  }
}
