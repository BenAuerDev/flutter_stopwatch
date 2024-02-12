import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Expects to find a Text-Widget with holding 'Start'
///
/// Once within the Widget Tree
void expectFindTextStart(WidgetTester tester) {
  expect(find.text('Start'), findsOneWidget);
}

/// Expects to not find a Text-Widget with holding 'Start'
///
/// within the Widget Tree
void notFindTextStart(WidgetTester tester) {
  expect(find.text('Start'), findsNothing);
}

/// Expects to find a Text-Widget with holding 'Stop'
///
/// Once within the Widget Tree
void expectFindTextStop(WidgetTester tester) {
  expect(find.text('Stop'), findsOneWidget);
}

/// Expects to not find a Text-Widget with holding 'Stop'
///
/// within the Widget Tree
void notExpectFindTextStop(WidgetTester tester) {
  expect(find.text('Stop'), findsNothing);
}

/// Expects to find a Text-Widget with holding 'Reset'
///
/// Once within the Widget Tree
void expectFindTextReset(WidgetTester tester) {
  expect(find.text('Reset'), findsOneWidget);
}

/// Expects to find a Text-Widget with holding 'Lap'
///
/// Once within the Widget Tree
void expectFindTextLap(WidgetTester tester) {
  expect(find.text('Lap'), findsOneWidget);
}

/// Expects to find a Text-Widget with holding 'Lap'
///
/// N times within the Widget Tree
void expectFindLapEntryNTimes(WidgetTester tester, int n) {
  expect(find.byKey(const Key('lapEntry')), findsNWidgets(n));
}
