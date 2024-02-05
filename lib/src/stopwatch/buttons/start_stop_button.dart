import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_animated_stopwatch/src/controllers/stopwatch_service.dart';

class StartStopButton extends ConsumerWidget {
  const StartStopButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(stopwatchProvider).isRunning;
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.red[900] : Colors.green[900], // button color
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              isRunning ? 'Stop' : 'Start',
            ),
          ),
        ),
      ),
    );
  }
}
