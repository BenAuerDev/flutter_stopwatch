import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> tapStart(WidgetTester tester) async {
  print('tapStart');
  await tester.tap(find.byKey(const Key('startStopButton')));
}

Future<void> tapStop(WidgetTester tester) async {
  await tester.tap(find.text('Stop'));
}

Future<void> tapLap(WidgetTester tester) async {
  await tester.tap(find.text('Lap'));
}

Future<void> tapReset(WidgetTester tester) async {
  await tester.tap(find.text('Reset'));
}
