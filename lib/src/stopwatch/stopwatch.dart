import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/stopwatch_ticker_ui.dart';

import 'package:flutter_animated_stopwatch/src/stopwatch/stopwatch_renderer.dart';

class Stopwatch extends HookWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(radius: radius),
            StopwatchTickerUi(radius: radius),
          ],
        );
      },
    );
  }
}
