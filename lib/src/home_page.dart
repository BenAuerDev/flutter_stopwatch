import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/stopwatch/stopwatch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Stopwatch(),
          ),
        ),
      ),
    );
  }
}
