import 'dart:math';
import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final double percent;
  final Color fillColor;
  final Color freeLineColor;
  final Color activeLineColor;
  final double lineWidth;
  final TextStyle textStyle;

  const RadialPercentWidget({
    Key? key,
    required percent,
    required this.fillColor,
    required this.freeLineColor,
    required this.activeLineColor,
    required this.lineWidth,
    required this.textStyle,
  })  : percent = percent / 100,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            freeLineColor: freeLineColor,
            activeLineColor: activeLineColor,
            lineWidth: lineWidth,
          ),
        ),
        Center(
          child: Text(
            '${percent * 100}%',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color freeLineColor;
  final Color activeLineColor;
  final double lineWidth;
  final int padding = 5;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.freeLineColor,
    required this.activeLineColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcRect(size);
    drawBackground(canvas, size);
    drawFreeLine(canvas, arcRect);
    drawActiveLine(canvas, arcRect);
  }

  Rect calculateArcRect(Size size) {
    return Offset(padding + (lineWidth / 2), padding + (lineWidth / 2)) &
        Size(size.width - ((padding * 2) + lineWidth),
            size.height - ((padding * 2) + lineWidth));
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  void drawFreeLine(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeLineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, (-pi / 2), (pi * 2), false, paint);
  }

  void drawActiveLine(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = activeLineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, (-pi / 2), (pi * 2) * percent, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
