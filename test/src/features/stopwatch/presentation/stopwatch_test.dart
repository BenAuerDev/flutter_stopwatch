import 'package:flutter_animated_stopwatch/main.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  Future<void> tapStart(WidgetTester tester) async {
    await tester.tap(find.text('Start'));
  }

  Future<void> tapStop(WidgetTester tester) async {
    await tester.tap(find.text('Stop'));
  }

  Future<void> tapReset(WidgetTester tester) async {
    await tester.tap(find.text('Reset'));
  }

  testWidgets('Stopwatch controls are displayed correctly', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Expect to find the start and reset buttons
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
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

    await tapStart(tester);
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

    await tapStart(tester);
    await tester.pump();
    expect(find.text('Start'), findsNothing);
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
