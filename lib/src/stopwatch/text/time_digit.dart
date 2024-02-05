import 'package:flutter/material.dart';

class TimeDigit extends StatelessWidget {
  const TimeDigit(this.text, {super.key, required this.width});
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
