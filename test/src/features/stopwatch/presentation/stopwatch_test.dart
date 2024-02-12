import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_animated_stopwatch/main.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';

import '../../../../test_utils/controls_methods.dart';
import '../../../../test_utils/expect_find.dart';

void main() {
  testWidgets('Stopwatch controls are displayed correctly', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Expect to find the start, Lap and reset buttons
    expectFindTextReset(tester);
    expectFindTextLap(tester);
    expectFindTextStart(tester);
  });

  testWidgets('isRunning is initially false', (tester) async {
    final provider = StopwatchState();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
        ],
        child: const MyApp(),
      ),
    );

    expect(provider.state.isRunning, false);
  });

  testWidgets('isRunning is set to true after starting', (tester) async {
    final provider = StopwatchState();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
        ],
        child: const MyApp(),
      ),
    );

    provider.start();
    await tester.pump();
    expect(provider.state.isRunning, true);
    provider.stop();
  });

  testWidgets(
      'Start-Stop-Button changes ButtonText to "Stop" after tapping Start',
      (tester) async {
    final provider = StopwatchState();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
        ],
        child: const MyApp(),
      ),
    );

    await tapStartStopButton(tester);
    await tester.pumpAndSettle();
    expectFindTextStart(tester);
    await tapStartStopButton(tester);
  });

  testWidgets(
      'Start-Stop-Button changes ButtonText back to "Start" after tapping Stop',
      (tester) async {
    final provider = StopwatchState();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
        ],
        child: const MyApp(),
      ),
    );

    await tapStartStopButton(tester);
    await tester.pump();
    await tapStartStopButton(tester);
    await tester.pump();
    expectFindTextStart(tester);
  });
}
