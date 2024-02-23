import 'package:flutter/material.dart';

class TippedClockHand extends StatelessWidget {
  const TippedClockHand({
    Key? key,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()..rotateZ(rotationZAngle),
      child: CustomPaint(
        painter: _HandPainter(handLength, handThickness, color),
        size: Size(handThickness, handLength),
      ),
    );
  }
}

class _HandPainter extends CustomPainter {
  final double handLength;
  final double handThickness;
  final Color color;

  _HandPainter(this.handLength, this.handThickness, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw the hand
    final path = Path()
      ..moveTo(
          size.width / 2, handThickness * 2) // Start at the base of the hand
      ..lineTo(size.width / 2 - handThickness,
          handThickness * 3) // Line to the left edge
      ..lineTo(size.width / 2, size.height) // Line to the tip
      ..lineTo(size.width / 2 + handThickness,
          handThickness * 3) // Line to the right edge
      ..close(); // Close the path to create a shape
    canvas.drawPath(path, paint);

    // Draw the circle at the base
    canvas.drawCircle(
      Offset(size.width / 2, handThickness * 2),
      handThickness * 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
