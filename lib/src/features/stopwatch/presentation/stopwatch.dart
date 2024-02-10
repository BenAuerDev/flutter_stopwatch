import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/controls/stopwatch_controls.dart';

import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/stopwatch_renderer.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/stopwatch_ticker_ui.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 140,
        left: 32,
        right: 32,
        bottom: 32,
      ),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final radius = constraints.maxWidth / 2;
            return Stack(
              children: [
                StopwatchRenderer(radius: radius),
                StopwatchTickerUi(radius: radius),
                const StopwatchControls(),
              ],
            );
          },
        ),
      ),
    );
  }
}
