import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/clock_hand/curved_clock_hand.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/clock_hand/simple_clock_hand.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/clock_hand/tipped_clock_hand.dart';

enum ClockHandType { simple, tipped, curved }

class ClockHandRenderer extends StatelessWidget {
  // TODO: think about making base-class for clock-hand that only differs on its paint method
  const ClockHandRenderer({
    super.key,
    this.handleType = ClockHandType.tipped,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  });

  final ClockHandType handleType;
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    switch (handleType) {
      case ClockHandType.simple:
        return SimpleClockHand(
          rotationZAngle: rotationZAngle,
          handThickness: handThickness,
          handLength: handLength,
          color: color,
        );
      case ClockHandType.tipped:
        return TippedClockHand(
          rotationZAngle: rotationZAngle,
          handThickness: handThickness,
          handLength: handLength,
          color: color,
        );

      case ClockHandType.curved:
        return CurvedClockHand(
          rotationZAngle: rotationZAngle,
          handThickness: handThickness,
          handLength: handLength,
          color: color,
        );
    }
  }
}
