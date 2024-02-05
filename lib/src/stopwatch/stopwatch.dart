import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_animated_stopwatch/src/controllers/stopwatch_service.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/buttons/reset_button.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/buttons/start_stop_button.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/stopwatch_renderer.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/stopwatch_ticker_ui.dart';

class Stopwatch extends ConsumerWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatch = ref.watch(stopwatchProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(radius: radius),
            StopwatchTickerUi(radius: radius),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  onPressed: () {
                    stopwatch.toggleStartStop();
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: () {
                    stopwatch.reset();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
