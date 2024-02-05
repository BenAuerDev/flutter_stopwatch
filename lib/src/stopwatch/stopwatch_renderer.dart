import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/markers/clock_seconds_tick_marker.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/markers/clock_text_marker.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({super.key, required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          )
      ],
    );
  }
}
