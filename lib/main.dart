import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Stopwatch',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
