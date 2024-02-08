import 'package:flutter/material.dart';

class LapEntry extends StatelessWidget {
  const LapEntry({
    super.key,
    required this.lap,
    required this.placement,
  });

  final Duration lap;
  final int placement;

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration d) {
      String twoDigits(int n) {
        if (n >= 10) return "$n";
        return "0$n";
      }

      String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
      String threeDigitMilliseconds =
          '${d.inMilliseconds.remainder(1000)}'.padLeft(3, '0');
      return "${twoDigits(d.inHours)}:$twoDigitMinutes:$twoDigitSeconds.$threeDigitMilliseconds";
    }

    String formatPlacement(int n) {
      if (n % 100 >= 11 && n % 100 <= 13) {
        return "${n}th";
      }
      switch (n % 10) {
        case 1:
          return "${n}  st";
        case 2:
          return "${n} nd";
        case 3:
          return "${n}  rd";
        default:
          return "${n}  th";
      }
    }

    TextStyle textStyle = const TextStyle().copyWith(
      fontSize: 20.0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          formatPlacement(placement),
          textAlign: TextAlign.end,
          style: textStyle,
        ),
        Text(formatDuration(lap), style: textStyle),
      ],
    );
  }
}
