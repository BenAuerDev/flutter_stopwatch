import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/presentation/lap_list.dart';
import 'package:flutter_animated_stopwatch/src/features/stopwatch/presentation/stopwatch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stopwatch(),
            LapList(),
          ],
        ),
      ),
    );
  }
}
