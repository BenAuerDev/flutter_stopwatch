import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/application/lap_service.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/buttons/reset_button.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/buttons/start_stop_button.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/stopwatch_renderer.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/stopwatch_ticker_ui.dart';

class Stopwatch extends ConsumerWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatch = ref.watch(stopwatchStateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 140, left: 32, right: 32, bottom: 32),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: LayoutBuilder(
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
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(lapServiceProvider.notifier).lap();
                      },
                      child: const Text('Lap'),
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
        ),
      ),
    );
  }
}
