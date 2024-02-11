import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Taps on The Start/Stop Button
///
/// It's the same Button as the Button
///
/// only changes it's Text to
///
/// Start when not running
///
/// and Stop when running
Future<void> tapStartStopButton(WidgetTester tester) async {
  await tester.tap(
    find.byKey(const Key('startStopButton')),
    warnIfMissed: false,
  );
}

/// Taps on The Lap Button
Future<void> tapLapButton(WidgetTester tester) async {
  await tester.tap(
    find.byKey(const Key('lapButton')),
    warnIfMissed: false,
  );
}

/// Taps on The Reset Button
Future<void> tapResetButton(WidgetTester tester) async {
  await tester.tap(
    find.byKey(const Key('resetButton')),
    warnIfMissed: false,
  );
}
