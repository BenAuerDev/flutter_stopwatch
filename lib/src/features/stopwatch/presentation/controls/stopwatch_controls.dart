import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/application/lap_service.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/controls/lap_button.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/controls/reset_button.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/controls/start_stop_button.dart';
import 'package:flutter_animated_stopwatch/src/utils/handle_scaffold_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StopwatchControls extends ConsumerWidget {
  const StopwatchControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatch = ref.watch(stopwatchStateProvider.notifier);

    final lapNotifier = ref.watch(lapServiceProvider.notifier);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              width: 80,
              height: 40,
              child: LapButton(
                onPressed: () {
                  lapNotifier.lap();
                  handleScaffoldMessage(context, 'Lap added');
                },
              )),
        ),
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
      ],
    );
  }
}
