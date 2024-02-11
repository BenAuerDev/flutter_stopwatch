import 'package:flutter_animated_stopwatch/main.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../test_utils/controls_methods.dart';

void main() {
  testWidgets('Stopwatch controls are displayed correctly', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Expect to find the start, Lap and reset buttons
    expect(find.text('Reset'), findsOneWidget);
    expect(find.text('Lap'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
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

  testWidgets('isRunning is set to true after tapping Start', (tester) async {
    final provider = StopwatchState();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
        ],
        child: const MyApp(),
      ),
    );

    // await tapStart(tester);
    await tester.tap(find.text('Start'));
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

    // await tapStart(tester);
    await tester.tap(find.text('Start'));
    await tester.pump();
    // expect(find.text('Start'), findsNothing);
    expect(find.text('Stop'), findsOneWidget);
    await tapStop(tester);
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

    await tapStart(tester);
    await tester.pump();
    await tapStop(tester);
    await tester.pump();
    expect(find.text('Stop'), findsNothing);
    expect(find.text('Start'), findsOneWidget);
  });
}
