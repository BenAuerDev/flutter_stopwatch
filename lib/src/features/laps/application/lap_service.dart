import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lap_service.g.dart';

@riverpod
class LapService extends _$LapService {
  @override
  List<Duration> build() {
    return [];
  }

  void lap() {
    final lap = ref.read(stopwatchStateProvider).currentlyElapsed;
    state = [...state, lap];
  }

  void reset() {
    state = [];
  }
}
