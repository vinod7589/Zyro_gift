import 'package:flutter/material.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({Key? key, required this.controller}) : super(key: key);

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    // Dispose of the controller
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    // Check if the current text doesn't contain the Rupee symbol
    if (!_controller.text.startsWith('₹')) {
      // If not present, add the Rupee symbol to the beginning
      _controller.text = '₹${_controller.text}$text';
    } else {
      // If the Rupee symbol is already present, just append the new text
      _controller.text = '${_controller.text}$text';
    }
  }

  void _backspace() {
    // Handle backspace logic, remove the last character from the controller
    if (_controller.text.isNotEmpty) {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
    }
  }
}
