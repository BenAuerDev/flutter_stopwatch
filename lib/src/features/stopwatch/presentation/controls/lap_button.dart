import 'package:flutter/material.dart';

class LapButton extends StatelessWidget {
  const LapButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Lap'),
    );
  }
}
