import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_animated_stopwatch/main.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/application/lap_service.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/application/stopwatch_service.dart';

import '../../../../test_utils/expect_find.dart';

void main() {
  testWidgets('Lap list initially shows a dash', (tester) async {
    final provider = StopwatchState();
    final lapService = LapService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
          lapServiceProvider.overrideWith(() => lapService),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('-'), findsOneWidget);
  });

  testWidgets('Lap list shows a lap after tapping Lap', (tester) async {
    final provider = StopwatchState();
    final lapService = LapService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
          lapServiceProvider.overrideWith(() => lapService),
        ],
        child: const MyApp(),
      ),
    );

    lapService.lap();
    await tester.pumpAndSettle();
    expectFindLapEntryNTimes(tester, 1);
    expect(find.text('00:00:00.000'), findsOneWidget);
    expect(find.text('-'), findsNothing);
  });

  testWidgets('Lap list shows the correct placements-suffix', (tester) async {
    final provider = StopwatchState();
    final lapService = LapService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          stopwatchStateProvider.overrideWith(() => provider),
          lapServiceProvider.overrideWith(() => lapService),
        ],
        child: const MyApp(),
      ),
    );

    for (var i = 0; i < 35; i++) {
      lapService.lap();
    }

    await tester.pumpAndSettle();
    expectFindLapEntryNTimes(tester, 35);
    expect(find.text('1  st'), findsOneWidget);
    expect(find.text('2 nd'), findsOneWidget);
    expect(find.text('3  rd'), findsOneWidget);
    expect(find.text('4  th'), findsOneWidget);

    expect(find.text('21  st'), findsOneWidget);
    expect(find.text('22 nd'), findsOneWidget);
    expect(find.text('23  rd'), findsOneWidget);
    expect(find.text('24  th'), findsOneWidget);

    expect(find.text('31  st'), findsOneWidget);
    expect(find.text('32 nd'), findsOneWidget);
    expect(find.text('33  rd'), findsOneWidget);
    expect(find.text('34  th'), findsOneWidget);
  });
}
