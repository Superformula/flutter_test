import 'dart:math';

import 'package:flutter/material.dart';

class CircularLoading extends StatefulWidget {
  const CircularLoading({super.key});

  @override
  CircularLoadingState createState() => CircularLoadingState();
}

class CircularLoadingState extends State<CircularLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _LoadingPainter(_controller.value),
          child: const SizedBox(
            width: 36,
            height: 36,
          ),
        );
      },
    );
  }
}

class _LoadingPainter extends CustomPainter {
  final double progress;

  _LoadingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    const double startAngle = -pi / 2;
    const double sweepAngle = 2 * pi * 0.75;
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final double rotateAngle = 2 * pi * progress;

    canvas.drawArc(rect, startAngle + rotateAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
