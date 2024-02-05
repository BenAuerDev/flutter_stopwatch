import 'package:flutter/material.dart';

import 'package:flutter_animated_stopwatch/src/controllers/stopwatch_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartStopButton extends ConsumerWidget {
  const StartStopButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(stopwatchStateProvider).isRunning;
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
