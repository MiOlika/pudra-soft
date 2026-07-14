import 'dart:math' as math;

import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double progress;
  final ColorScheme colorScheme;

  BorderPainter(this.progress, this.colorScheme);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(20),
    );

    // Создаем градиент для обводки
    final colors = [
      colorScheme.primary.withValues(alpha: 0.7),
      colorScheme.secondary.withValues(alpha: 0.5),
      colorScheme.tertiary.withValues(alpha: 0.1),
      colorScheme.primary.withValues(alpha: 0.7),
    ];

    // Анимируем позицию градиента
    final offset = progress * 2 * 3.14159;
    final startX = 0.5 + 0.5 * math.sin(offset);
    final startY = 0.5 + 0.5 * math.cos(offset);
    final endX = 0.5 + 0.5 * math.sin(offset + 3.14159);
    final endY = 0.5 + 0.5 * math.cos(offset + 3.14159);

    final gradient = LinearGradient(
      begin: Alignment(startX, startY),
      end: Alignment(endX, endY),
      colors: colors,
    );

    // Рисуем обводку
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant BorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
