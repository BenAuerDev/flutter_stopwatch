import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/clock_hand.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/text/elapsed_time_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StopwatchTickerUi extends ConsumerWidget {
  const StopwatchTickerUi({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elapsed = ref.watch(stopwatchStateProvider).currentlyElapsed;

    return Stack(
      children: [
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: const Color(0xFF0CCC13),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(elapsed: elapsed),
        ),
      ],
    );
  }
}
