import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_animated_stopwatch/src/models/stopwatch_data.dart';

part 'stopwatch_service.g.dart';

@riverpod
class StopwatchState extends _$StopwatchState {
  @override
  StopwatchData build() {
    return const StopwatchData(
      previouslyElapsed: Duration.zero,
      currentlyElapsed: Duration.zero,
      isRunning: false,
    );
  }

  Ticker? _ticker;

  void start() {
    _ticker = Ticker((elapsed) {
      state = state.copyWith(
        currentlyElapsed: elapsed,
        isRunning: true,
      );
    });
    _ticker?.start();
  }

  void stop() {
    state = state.copyWith(
      previouslyElapsed: state.currentlyElapsed,
      isRunning: false,
    );
    _ticker?.stop();
  }

  void resume() {
    _ticker = Ticker((elapsed) {
      state = state.copyWith(
        currentlyElapsed: state.previouslyElapsed + elapsed,
        isRunning: true,
      );
    });
    _ticker?.start();
  }

  void toggleStartStop() {
    if (_ticker == null) {
      start();
    } else if (_ticker!.isActive) {
      stop();
    } else {
      resume();
    }
  }

  void reset() {
    _ticker?.dispose();
    state = const StopwatchData(
      previouslyElapsed: Duration.zero,
      currentlyElapsed: Duration.zero,
      isRunning: false,
    );
  }
}
