import 'package:flutter/material.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/application/lap_service.dart';
import 'package:flutter_animated_stopwatch/src/features/laps/presentation/lap_entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LapList extends HookConsumerWidget {
  const LapList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final laps = ref.watch(lapServiceProvider);

    if (laps.isEmpty) {
      return const Center(
        child: Text('-'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(32.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: laps.length,
      itemBuilder: (_, index) {
        return LapEntry(
          lap: laps[index],
          placement: index + 1,
        );
      },
    );
  }
}
