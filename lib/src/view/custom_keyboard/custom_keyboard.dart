import 'dart:convert';

import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/CartDataModel.dart';
import '../mobile_view/home_page/payment/payment_option_page.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;
  final int startValue;
  final int endValue;
  final num availableLimit;
  final String brandCode;
  final num discount;
  const NumericKeypad(
      {Key? key,
      required this.controller,
      required this.startValue,
      required this.endValue,
      required this.availableLimit,
      required this.brandCode,
      required this.discount})
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
    setState(() {
      current_net_value = lower;
    });
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
                  ? widget.availableLimit >= current_net_value
                      ? ''
                      : 'You have a maximum limit of ${widget.availableLimit}.'
                  : 'Please enter amount between $lower and $upper',
              style: const TextStyle(color: Colors.red),
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
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (current_net_value >= lower &&
                    current_net_value <= upper &&
                    current_net_value <= widget.availableLimit) {
                  var vouchers = [];
                  var req = {"qty": 1, "amount": current_net_value as num};
                  vouchers.add(req);
                  var finalRequest = {
                    "userId": UserPreferences.userId,
                    "brandcode": widget.brandCode,
                    "discount": widget.discount,
                    "vouchers": vouchers
                  };
                  print(json.encode(finalRequest));
                  CartDataModel cart = CartDataModel.fromJson(finalRequest);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentOptionPage(
                                cartDataDetails: cart,
                                brandCode: widget.brandCode,
                              )));
                } else {}
              },
              child: Container(
                alignment: Alignment.center,
                width: 320.w,
                height: 51.h,
                decoration: ShapeDecoration(
                  color: (current_net_value >= lower &&
                          current_net_value <= upper &&
                          current_net_value <= widget.availableLimit)
                      ? Colors.white
                      : Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: (current_net_value >= lower &&
                                current_net_value <= upper &&
                                current_net_value <= widget.availableLimit)
                            ? Color(0xFF8C8C8C)
                            : Colors.white10),
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    color: (current_net_value >= lower &&
                            current_net_value <= upper &&
                            current_net_value <= widget.availableLimit)
                        ? Colors.black87
                        : Colors.white30,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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
    if (_controller.text.isEmpty) {
      _controller.text = '₹ ${_controller.text}$text';
    } else {
      _controller.text = '${_controller.text}$text';
    }
    _controller.notifyListeners();
    setState(() {
      current_net_value = int.parse(_controller.text.replaceAll('₹ ', ''));
    });
  }

  void _backspace() {
    // Handle backspace logic, remove the last character from the controller
    if (_controller.text.isNotEmpty) {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
      _controller.notifyListeners();

      if (_controller.text == '₹ ') {
        _controller.text = '';
      }
      setState(() {
        current_net_value = int.parse(_controller.text.replaceAll('₹ ', ''));
      });
    }
  }
}
